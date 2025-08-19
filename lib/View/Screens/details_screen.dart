import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../Model/product_model.dart';
import '../../helper/app_colors.dart';
import '../Widgets/product_image_widget.dart';
import '../Widgets/product_details_content_widget.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  static const String id = '/details';

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _scrollAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late ScrollController _scrollController;

  int _selectedSize = 1;
  Color _selectedColor = const Color(0xFF3B82F6);
  double _scrollOffset = 0.0;

  final List<String> _sizes = ['S', 'M', 'L', 'XL'];
  final List<Color> _colors = [
    Color(0xFF3B82F6),
    Color(0xFF8B5CF6),
    Color(0xFF10B981),
    Color(0xFFEF4444),
    Color(0xFF1A1D29),
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scrollAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scrollController = ScrollController()..addListener(_onScroll);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
      ),
    );

    _animationController.forward();
  }

  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  void _onSizeSelected(int index) {
    setState(() => _selectedSize = index);
  }

  void _onColorSelected(Color color) {
    setState(() => _selectedColor = color);
  }

  Widget _buildBackButton() {
    double opacity = (_scrollOffset / 200).clamp(0.0, 1.0);
    double scale = 1.0 - (opacity * 0.1);

    return Transform.scale(
      scale: scale,
      child: InkWell(
        onTap: () => context.pop(),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryText),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }

  Widget _buildFlexibleSpaceBackground() {
    double parallaxOffset = _scrollOffset * 0.5;
    double imageScale = 1.0 + (_scrollOffset / 1000);
    double imageOpacity = (1.0 - (_scrollOffset / 300)).clamp(0.0, 1.0);

    return Transform.translate(
      offset: Offset(0, parallaxOffset),
      child: Transform.scale(
        scale: imageScale,
        child: Opacity(
          opacity: imageOpacity,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.cardBackground, Colors.white],
              ),
            ),
            child: ProductImageWidget(
              product: widget.product,
              fadeAnimation: _fadeAnimation,
              selectedColor: _selectedColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 380,
            pinned: true,
            backgroundColor: AppColors.scaffoldBackground,
            elevation: 0,
            leading: AnimatedBuilder(
              animation: _scrollController.hasClients
                  ? Listenable.merge([_scrollController])
                  : const AlwaysStoppedAnimation(0),
              builder: (context, child) => _buildBackButton(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: AnimatedBuilder(
                animation: _scrollController.hasClients
                    ? Listenable.merge([_scrollController])
                    : const AlwaysStoppedAnimation(0),
                builder: (context, child) => _buildFlexibleSpaceBackground(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AnimatedBuilder(
              animation: _scrollController.hasClients
                  ? Listenable.merge([_scrollController])
                  : const AlwaysStoppedAnimation(0),
              builder: (context, child) {
                return ProductDetailsContentWidget(
                  product: widget.product,
                  selectedColor: _selectedColor,
                  selectedSize: _selectedSize,
                  sizes: _sizes,
                  colors: _colors,
                  onSizeSelected: _onSizeSelected,
                  onColorSelected: _onColorSelected,
                  scrollOffset: _scrollOffset,
                  slideAnimation: _slideAnimation,
                  fadeAnimation: _fadeAnimation,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../Model/product_model.dart';
import '../../helper/app_colors.dart';
import 'product_header_widget.dart';
import 'product_rating_widget.dart';
import 'product_description_widget.dart';
import 'size_selector_widget.dart';
import 'color_selector_widget.dart';
import 'add_to_cart_button_widget.dart';

class ProductDetailsContentWidget extends StatelessWidget {
  final Product product;
  final Color selectedColor;
  final int selectedSize;
  final List<String> sizes;
  final List<Color> colors;
  final Function(int) onSizeSelected;
  final Function(Color) onColorSelected;
  final double scrollOffset;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;

  const ProductDetailsContentWidget({
    super.key,
    required this.product,
    required this.selectedColor,
    required this.selectedSize,
    required this.sizes,
    required this.colors,
    required this.onSizeSelected,
    required this.onColorSelected,
    required this.scrollOffset,
    required this.slideAnimation,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    double contentOpacity = ((scrollOffset - 100) / 200).clamp(0.0, 1.0);
    double contentTranslate = (1.0 - contentOpacity) * 30;

    return Transform.translate(
      offset: Offset(0, contentTranslate),
      child: Opacity(
        opacity: 0.3 + (contentOpacity * 0.7),
        child: SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 40 + (scrollOffset / 20).clamp(0.0, 20.0),
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.border.withOpacity(
                            0.5 + (contentOpacity * 0.5),
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      transform: Matrix4.translationValues(
                        0,
                        (1.0 - contentOpacity) * 20,
                        0,
                      ),
                      child: ProductHeaderWidget(
                        product: product,
                        selectedColor: selectedColor,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const ProductRatingWidget(),

                    const SizedBox(height: 20),

                    const ProductDescriptionWidget(),

                    const SizedBox(height: 20),

                    SizeSelectorWidget(
                      selectedSize: selectedSize,
                      onSizeSelected: onSizeSelected,
                      sizes: sizes,
                    ),

                    const SizedBox(height: 20),

                    ColorSelectorWidget(
                      selectedColor: selectedColor,
                      onColorSelected: onColorSelected,
                      colors: colors,
                    ),

                    const SizedBox(height: 30),

                    AddToCartButtonWidget(
                      product: product,
                      selectedColor: selectedColor,
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart' ;
import '../../Model/product_model.dart';
import '../Widgets/filter_button_widget.dart';
import '../Widgets/reusable_widgets.dart';
import '../Widgets/search_bar_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String _searchQuery = '';
  List<Product> _filteredProducts = Product.products;

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredProducts = Product.products;
      } else {
        _filteredProducts = Product.products.where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase())
        ).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarr(onSearchChanged: _onSearchChanged),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              buildFilterButton('All', true),
              const SizedBox(width: 8),
              buildFilterButton('Featured', false),
              const SizedBox(width: 8),
              buildFilterButton('New', false),
            ],
          ),
        ),
        const SizedBox(height: 16),

        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.7,
            ),
            itemCount: _filteredProducts.length,
            itemBuilder: (context, index) {
              final product = _filteredProducts[index];
              return ProductCard(product: product);
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../Model/product_model.dart';
import '../../helper/app_colors.dart';

class ProductImageWidget extends StatelessWidget {
  final Product product;
  final Animation<double> fadeAnimation;
  final Color selectedColor;

  const ProductImageWidget({
    super.key,
    required this.product,
    required this.fadeAnimation,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Hero(
          tag: 'product-${product.id}',
          child: Container(
            margin: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: selectedColor.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: selectedColor.withOpacity(0.1),
                  blurRadius: 40,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../Model/product_model.dart';
import '../../helper/app_colors.dart';

class ProductHeaderWidget extends StatelessWidget {
  final Product product;
  final Color selectedColor;

  const ProductHeaderWidget({
    super.key,
    required this.product,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            product.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
              fontFamily: 'Inter',
              color: AppColors.primaryText,
              height: 1.2,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: selectedColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            product.price,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              fontFamily: 'Inter',
              color: selectedColor,
            ),
          ),
        ),
      ],
    );
  }
}

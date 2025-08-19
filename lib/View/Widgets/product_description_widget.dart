import 'package:flutter/material.dart';
import '../../helper/app_colors.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Premium quality product with style and comfort. Made with high-quality materials for everyday wear.',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
            color: AppColors.secondaryText,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

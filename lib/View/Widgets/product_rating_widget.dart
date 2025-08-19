import 'package:flutter/material.dart';
import '../../helper/app_colors.dart';

class ProductRatingWidget extends StatelessWidget {
  const ProductRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: index < 4 ? Colors.amber : AppColors.border,
              size: 18,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          '4.0 (128 reviews)',
          style: TextStyle(
            color: AppColors.secondaryText,
            fontSize: 13,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../helper/app_colors.dart';

class SizeSelectorWidget extends StatelessWidget {
  final int selectedSize;
  final Function(int) onSizeSelected;
  final List<String> sizes;

  const SizeSelectorWidget({
    super.key,
    required this.selectedSize,
    required this.onSizeSelected,
    required this.sizes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(
            sizes.length,
            (index) => GestureDetector(
              onTap: () => onSizeSelected(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: selectedSize == index
                      ? AppColors.accent
                      : AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedSize == index
                        ? AppColors.accent
                        : AppColors.border,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  sizes[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: selectedSize == index
                        ? FontWeight.w400
                        : FontWeight.w300,
                    fontFamily: 'Inter',
                    color: selectedSize == index
                        ? Colors.white
                        : AppColors.primaryText,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

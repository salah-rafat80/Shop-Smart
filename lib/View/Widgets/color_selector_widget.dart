import 'package:flutter/material.dart';
import '../../helper/app_colors.dart';

class ColorSelectorWidget extends StatelessWidget {
  final Color selectedColor;
  final Function(Color) onColorSelected;
  final List<Color> colors;

  const ColorSelectorWidget({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
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
            colors.length,
            (index) => GestureDetector(
              onTap: () => onColorSelected(colors[index]),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 10),
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: colors[index],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColor == colors[index]
                        ? AppColors.primaryText
                        : Colors.transparent,
                    width: 2.5,
                  ),
                ),
                child: selectedColor == colors[index]
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

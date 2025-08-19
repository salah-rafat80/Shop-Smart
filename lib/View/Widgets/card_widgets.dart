import 'package:flutter/material.dart';
import 'package:shop_smart/View/Widgets/reusable_widgets.dart';

import '../../helper/app_colors.dart';

Widget amountRow(
  String left,
  String right, {
  bool secondary = false,
  bool boldRight = false,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        left,
        style: TextStyle(
          color: secondary ? AppColors.secondaryText : AppColors.primaryText,
          fontSize: secondary ? 12 : 14,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
        ),
      ),
      Text(
        right,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: boldRight ? 16 : 14,
          fontWeight: boldRight ? FontWeight.w400 : FontWeight.w500,
          fontFamily: "Inter",
        ),
      ),
    ],
  );
}

class CartRow extends StatelessWidget {
  final String title;
  final String priceText;
  final String image;
  final int qty;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const CartRow({
    required this.title,
    required this.priceText,
    required this.image,
    required this.qty,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFF0F2F5),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 12),
        // Title + price
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 20 / 14,
                  fontFamily: "Inter",
                ),
              ),
              const SizedBox(height: 2),
              Text(
                priceText,
                style: const TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 16 / 12,
                  fontFamily: "Inter",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        QtyControl(qty: qty, onMinus: onMinus, onPlus: onPlus),
      ],
    );
  }
}

void CartSnackBar(BuildContext context,) {

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      animation: const AlwaysStoppedAnimation(1.0),
      dismissDirection: DismissDirection.horizontal,

      content: Text("Proceeding to checkout..."),
      backgroundColor: AppColors.success,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(
        bottom: 80, // Raise it higher by increasing this value
        left: 16,
        right: 16,
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
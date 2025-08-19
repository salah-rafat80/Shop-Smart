
import 'package:flutter/material.dart';

import '../../helper/app_colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> CustomShowSnackBar(BuildContext context, bool inCart) {
  return ScaffoldMessenger.of(
    context,
  ).showSnackBar(
    SnackBar(
      content: Text(
        inCart
            ? 'Removed from cart'
            : 'Added to cart successfully!',
      ),
      backgroundColor: inCart
          ? AppColors.error
          : AppColors.success,
      behavior:
      SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(12),
      ),
      duration: const Duration(
        seconds: 2,
      ),
    ),
  );
}
import 'package:flutter/material.dart';

import '../../helper/app_colors.dart';

Widget buildFilterButton(String text, bool isActive) {
  return Container(
    decoration: BoxDecoration(
      color: isActive
          ? AppColors.filterButtonActive
          : AppColors.filterButtonInactiveBackground,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: isActive ? AppColors.filterButtonActive : Colors.grey[300]!,
      ),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.white : AppColors.primaryText,
              fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
              fontSize: 14.0,
              height: 21 / 14,
            ),
          ),
        ),
      ),
    ),
  );
}

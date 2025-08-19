import 'package:flutter/material.dart';
import 'package:shop_smart/helper/app_colors.dart';

class SearchBarr extends StatelessWidget {
  final Function(String)? onSearchChanged;

  const SearchBarr({
    super.key,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: AppColors.secondaryText,
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.secondaryText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.searchBarBackground,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }
}

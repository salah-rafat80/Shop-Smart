import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller/card_controller.dart';
import '../../helper/app_colors.dart';

PreferredSizeWidget buildAppBar(dynamic _selectedIndex, Function(int) _onItemTapped) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
    title: Text(
      _selectedIndex == 1 ? 'Cart' : 'Shop Smart',
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
        fontStyle: FontStyle.normal,
        fontSize: 18,
        color: AppColors.primaryText,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: _selectedIndex == 1
            ? SizedBox()
            : Icon(Icons.shopping_cart_outlined),
        onPressed: () => _onItemTapped(1),
      ),
      const SizedBox(width: 8),
    ],
  );
}
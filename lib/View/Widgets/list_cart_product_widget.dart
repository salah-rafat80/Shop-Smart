
import 'package:flutter/material.dart';

import '../Screens/cart_screen.dart';
import 'card_widgets.dart';

class ListCartProduct extends StatelessWidget {
  const ListCartProduct({
    super.key, this.cart,
  });
  final dynamic cart;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: cart.items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final item = cart.items[i];
          return CartRow(
            title: item.product.name,
            priceText: item.product.price,
            image: item.product.imageUrl,
            qty: item.qty,
            onMinus: () => cart.removeOne(item.product),
            onPlus: () => cart.add(item.product),
          );
        },
      ),
    );
  }
}

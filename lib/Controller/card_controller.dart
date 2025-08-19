import 'package:flutter/material.dart';
import 'package:shop_smart/Model/product_model.dart';

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, this.qty = 1});
}

class CardController extends ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => List.unmodifiable(_items);

  bool isInCart(Product p) => _items.any((e) => e.product.id == p.id);

  int qtyOf(Product p) {
    final it = _items.where((e) => e.product.id == p.id);
    return it.isEmpty ? 0 : it.first.qty;
  }

  void add(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx == -1) {
      _items.add(CartItem(product: p, qty: 1));
    } else {
      _items[idx].qty += 1;
    }
    notifyListeners();
  }

  void removeOne(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx == -1) return;
    final item = _items[idx];
    if (item.qty > 1) {
      item.qty -= 1;
    } else {
      _items.removeAt(idx);
    }
    notifyListeners();
  }

  void removeLine(Product p) {
    _items.removeWhere((e) => e.product.id == p.id);
    notifyListeners();
  }

  double get subtotal {
    double s = 0;
    for (final it in _items) {
      s += _parsePrice(it.product.price) * it.qty;
    }
    return s;
  }

  double get taxes => 5.00;
  double get total => subtotal + taxes;

  double _parsePrice(String price) {
    final cleaned = price.replaceAll('\$', '').trim();
    return double.tryParse(cleaned) ?? 0.0;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

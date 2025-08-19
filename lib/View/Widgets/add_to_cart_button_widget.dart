import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/product_model.dart';
import '../../Controller/card_controller.dart';
import '../../helper/app_colors.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final Product product;
  final Color selectedColor;

  const AddToCartButtonWidget({
    super.key,
    required this.product,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CardController>(
      builder: (context, cart, _) {
        final inCart = cart.isInCart(product);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (inCart) {
                cart.removeLine(product);
              } else {
                cart.add(product);
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    inCart
                        ? 'Removed from cart'
                        : 'Added to cart successfully!',
                  ),
                  backgroundColor: inCart
                      ? AppColors.error
                      : AppColors.success,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: inCart
                  ? AppColors.error
                  : selectedColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  inCart
                      ? Icons.remove_shopping_cart
                      : Icons.add_shopping_cart,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  inCart ? 'Remove from Cart' : 'Add to Cart',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

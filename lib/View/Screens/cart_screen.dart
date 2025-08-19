import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Controller/card_controller.dart';
import '../../helper/app_colors.dart';
import '../Widgets/card_widgets.dart';
import '../Widgets/list_cart_product_widget.dart';
class CartTab extends StatelessWidget {
  const CartTab();

  @override
  Widget build(BuildContext context) {
    return Consumer<CardController>(
      builder: (context, cart, _) {
        if (cart.items.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Your cart is empty',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }
        return Column(
          children: [
            const SizedBox(height: 12),
            ListCartProduct(cart: cart),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          amountRow(
                            'Subtotal:     ',
                            '\$${cart.subtotal.toStringAsFixed(2)}',
                          ),
                          const SizedBox(height: 4),
                          amountRow(
                            'Taxes:            ',
                            '\$${cart.taxes.toStringAsFixed(2)}',
                            secondary: true,
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      amountRow(
                        '',
                        '\$${cart.total.toStringAsFixed(2)}',
                        boldRight: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        CartSnackBar(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0D80F2),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Proceed to Checkout',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

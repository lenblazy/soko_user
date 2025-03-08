import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/providers/cart_provider.dart';
import 'package:soko_user/providers/products_provider.dart';
import 'package:soko_user/widgets/subtitle_text.dart';
import 'package:soko_user/widgets/title_text.dart';

class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TitleTextWidget(
                        label:
                            "Total (${cartProvider.getCartItems.length} products / ${cartProvider.getQty()} items)",
                      ),
                    ),
                    SubtitleTextWidget(
                      label:
                          "${cartProvider.getTotal(productsProvider: productsProvider)} \$",
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Checkout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

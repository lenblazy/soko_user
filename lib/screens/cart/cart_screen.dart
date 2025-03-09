import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/providers/cart_provider.dart';
import 'package:soko_user/screens/cart/bottom_checkout.dart';
import 'package:soko_user/services/asset_manager.dart';
import 'package:soko_user/services/my_app_functions.dart';
import 'package:soko_user/widgets/empty_bag.dart';
import 'package:soko_user/widgets/title_text.dart';

import 'cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetManager.shoppingBasket,
              title: "Your Cart Is Empty",
              subtitle:
                  "Looks like your cart is empty, Add some items to get started",
              buttonText: "Shop Now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetManager.shoppingBasket),
              ),
              title: TitleTextWidget(
                label: "Cart (${cartProvider.getCartItems.length})",
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppFunctions.showErrorOrWarningDialog(
                      isError: false,
                      context: context,
                      subtitle: "Clear Cart?",
                      fct: () {
                        cartProvider.clearLocalCart();
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            bottomSheet: CartBottomSheetWidget(),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.getCartItems.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value:
                              cartProvider.getCartItems.values.toList()[index],
                          child: const CartWidget());
                    },
                  ),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 20,
                )
              ],
            ),
          );
  }
}

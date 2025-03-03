import 'package:flutter/material.dart';
import 'package:soko_user/services/asset_manager.dart';
import 'package:soko_user/widgets/empty_bag.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EmptyBagWidget(
      imagePath: AssetManager.shoppingBasket,
      title: "Your Cart Is Empty",
      subtitle: "Looks like your cart is empty, Add some items to get started",
      buttonText: "Shop Now",
    ));
  }
}

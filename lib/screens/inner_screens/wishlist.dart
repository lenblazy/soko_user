import 'package:flutter/material.dart';
import 'package:soko_user/screens/cart/bottom_checkout.dart';
import 'package:soko_user/services/asset_manager.dart';
import 'package:soko_user/widgets/empty_bag.dart';
import 'package:soko_user/widgets/title_text.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const String routeName = "/wishlistScreen";
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetManager.bagWish,
              title: "Your wishlist Is Empty",
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
              title: const TitleTextWidget(label: "Wishlist (6)"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            bottomSheet: CartBottomSheetWidget(),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Center();
              },
            ),
          );
  }
}

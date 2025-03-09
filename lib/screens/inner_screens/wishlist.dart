import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/providers/wishlist_provider.dart';
import 'package:soko_user/screens/cart/bottom_checkout.dart';
import 'package:soko_user/services/asset_manager.dart';
import 'package:soko_user/services/my_app_functions.dart';
import 'package:soko_user/widgets/empty_bag.dart';
import 'package:soko_user/widgets/title_text.dart';

import '../../widgets/products/product_widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const String routeName = "/wishlistScreen";
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlistItems.isEmpty
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
              title: TitleTextWidget(
                label: "Wishlist (${wishlistProvider.getWishlistItems.length})",
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppFunctions.showErrorOrWarningDialog(
                      isError: false,
                      context: context,
                      subtitle: "Clear Wishlist?",
                      fct: () {
                        wishlistProvider.clearLocalWishlist();
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            bottomSheet: CartBottomSheetWidget(),
            body: DynamicHeightGridView(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              builder: (context, index) {
                return ProductWidget(
                  productId: wishlistProvider.getWishlistItems.values
                      .toList()[index]
                      .productId,
                );
              },
              itemCount: wishlistProvider.getWishlistItems.length,
              crossAxisCount: 2,
            ),
          );
  }
}

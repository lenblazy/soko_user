import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/providers/viewed_recently_provider.dart';
import 'package:soko_user/services/asset_manager.dart';
import 'package:soko_user/widgets/empty_bag.dart';
import 'package:soko_user/widgets/products/product_widget.dart';
import 'package:soko_user/widgets/title_text.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  const ViewedRecentlyScreen({super.key});
  static const String routeName = "/viewedRecentlyScreen";

  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);
    return viewedRecentlyProvider.getViewedRecentlyItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetManager.orderBag,
              title: "No viewed products yet",
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
                label:
                    "Viewed recently (${viewedRecentlyProvider.getViewedRecentlyItems.length})",
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DynamicHeightGridView(
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                builder: (context, index) {
                  return ProductWidget(
                    productId: viewedRecentlyProvider
                        .getViewedRecentlyItems.values
                        .toList()[index]
                        .productId,
                  );
                },
                itemCount: viewedRecentlyProvider.getViewedRecentlyItems.length,
                crossAxisCount: 2,
              ),
            ),
          );
  }
}

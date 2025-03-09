import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/models/products_model.dart';
import 'package:soko_user/providers/cart_provider.dart';
import 'package:soko_user/providers/viewed_recently_provider.dart';
import 'package:soko_user/screens/inner_screens/product_details_screen.dart';
import 'package:soko_user/widgets/products/heart_btn.dart';
import 'package:soko_user/widgets/subtitle_text.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productModel = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          viewedRecentlyProvider.addToViewedRecently(
            productId: productModel.productId,
          );
          await Navigator.pushNamed(
            context,
            ProductDetailsScreen.routeName,
            arguments: productModel.productId,
          );
          // Navigator.pushReplacementNamed(context, ProductDetailsScreen.routeName);
        },
        child: SizedBox(
          width: size.width * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  imageUrl: productModel.productImage,
                  height: size.width * 0.28,
                  width: size.width * 0.24,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      productModel.productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          HeartBtnWidget(
                            productId: productModel.productId,
                          ),
                          IconButton(
                            onPressed: () {
                              if (cartProvider.isProdInCart(
                                  productId: productModel.productId)) {
                                return;
                              }
                              cartProvider.addToCart(
                                productId: productModel.productId,
                              );
                            },
                            icon: Icon(
                              cartProvider.isProdInCart(
                                      productId: productModel.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: SubtitleTextWidget(
                        label: "${productModel.productPrice}\$",
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

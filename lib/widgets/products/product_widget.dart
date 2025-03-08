import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/providers/products_provider.dart';
import 'package:soko_user/screens/inner_screens/product_details_screen.dart';
import 'package:soko_user/widgets/subtitle_text.dart';

import '../title_text.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    // final productModel = Provider.of<ProductModel>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);
    final getCurrentProduct = productsProvider.findByProdId(widget.productId);

    Size size = MediaQuery.of(context).size;
    return getCurrentProduct == null
        ? SizedBox.shrink()
        : GestureDetector(
            onTap: () async {
              await Navigator.pushNamed(
                  context, ProductDetailsScreen.routeName);
              // Navigator.pushReplacementNamed(context, ProductDetailsScreen.routeName);
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl: getCurrentProduct.productImage,
                    height: size.height * 0.2,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: TitleTextWidget(
                        maxLines: 2,
                        label: getCurrentProduct.productTitle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.heart),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SubtitleTextWidget(
                        label: getCurrentProduct.productPrice,
                        color: Colors.blue,
                      ),
                    ),
                    Flexible(
                      child: Material(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.lightBlue,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.0),
                          onTap: () {},
                          splashColor: Colors.red,
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.add_shopping_cart_outlined,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          );
  }
}

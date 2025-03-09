import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/providers/wishlist_provider.dart';

class HeartBtnWidget extends StatefulWidget {
  const HeartBtnWidget({
    super.key,
    this.bkgColor = Colors.transparent,
    this.size = 20,
    required this.productId,
    // this.isInWishlist = false,
  });

  final Color bkgColor;
  final double size;
  final String productId;
  // final bool? isInWishlist;

  @override
  State<HeartBtnWidget> createState() => _HeartBtnWidgetState();
}

class _HeartBtnWidgetState extends State<HeartBtnWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: widget.bkgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        // style: IconButton.styleFrom(elevation: 10),
        onPressed: () {
          wishlistProvider.addOrRemoveFromWishlist(productId: widget.productId);
        },
        icon: Icon(
          wishlistProvider.isProdInWishlist(productId: widget.productId)
              ? IconlyBold.heart
              : IconlyLight.heart,
          size: widget.size,
          color: wishlistProvider.isProdInWishlist(productId: widget.productId)
              ? Colors.red
              : Colors.grey,
        ),
      ),
    );
  }
}

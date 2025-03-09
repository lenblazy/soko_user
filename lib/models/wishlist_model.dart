import 'package:flutter/material.dart';

class WishlistModel with ChangeNotifier {
  final String productId, wishlistId;

  WishlistModel({
    required this.productId,
    required this.wishlistId,
  });
}

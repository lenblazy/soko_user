import 'package:flutter/material.dart';

class ViewedRecentlyModel with ChangeNotifier {
  final String productId, viewedProductId;

  ViewedRecentlyModel({
    required this.viewedProductId,
    required this.productId,
  });
}

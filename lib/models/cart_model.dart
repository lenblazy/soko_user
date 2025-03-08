import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  final String productId, cardId;
  final int quantity;

  CartModel({
    required this.productId,
    required this.cardId,
    required this.quantity,
  });
}

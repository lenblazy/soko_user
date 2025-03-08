import 'package:flutter/cupertino.dart';
import 'package:soko_user/models/cart_model.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  void addToCart({required String productId}) {
    _cartItems.putIfAbsent(
        productId,
        () => CartModel(
              productId: productId,
              cardId: const Uuid().v4(),
              quantity: 1,
            ));
    notifyListeners();
  }

  bool isProdInCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }
}

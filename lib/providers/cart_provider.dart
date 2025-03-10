import 'package:flutter/cupertino.dart';
import 'package:soko_user/models/cart_model.dart';
import 'package:soko_user/providers/products_provider.dart';
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

  void updateQty({
    required String productId,
    required int qty,
  }) {
    _cartItems.update(
        productId,
        (cartItem) => CartModel(
              productId: productId,
              cardId: cartItem.cardId,
              quantity: qty,
            ));
    notifyListeners();
  }

  bool isProdInCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }

  double getTotal({required ProductsProvider productsProvider}) {
    double total = 0;
    _cartItems.forEach((key, value) {
      final productPrice =
          productsProvider.findByProdId(value.productId)?.productPrice;
      if (productPrice != null) {
        total += double.parse(productPrice) * value.quantity;
      }
    });
    return total;
  }

  int getQty() {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  void clearLocalCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }
}

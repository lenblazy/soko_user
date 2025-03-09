import 'package:flutter/cupertino.dart';
import 'package:soko_user/models/wishlist_model.dart';
import 'package:uuid/uuid.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistModel> _wishlistItems = {};
  Map<String, WishlistModel> get getWishlistItems {
    return _wishlistItems;
  }

  void addOrRemoveFromWishlist({required String productId}) {
    if (_wishlistItems.containsKey(productId)) {
      _wishlistItems.remove(productId);
    } else {
      _wishlistItems.putIfAbsent(
        productId,
        () => WishlistModel(
          productId: productId,
          wishlistId: const Uuid().v4(),
        ),
      );
    }
    notifyListeners();
  }

  bool isProdInWishlist({required String productId}) {
    return _wishlistItems.containsKey(productId);
  }

  void clearLocalWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _wishlistItems.remove(productId);
    notifyListeners();
  }
}

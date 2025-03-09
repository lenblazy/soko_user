import 'package:flutter/cupertino.dart';
import 'package:soko_user/models/viewed_products_model.dart';
import 'package:uuid/uuid.dart';

class ViewedRecentlyProvider with ChangeNotifier {
  final Map<String, ViewedRecentlyModel> _wishlistItems = {};
  Map<String, ViewedRecentlyModel> get getViewedRecentlyItems {
    return _wishlistItems;
  }

  void addToViewedRecently({required String productId}) {
    _wishlistItems.putIfAbsent(
      productId,
      () => ViewedRecentlyModel(
        productId: productId,
        viewedProductId: const Uuid().v4(),
      ),
    );
    notifyListeners();
  }

  void clearLocalViewedRecently() {
    _wishlistItems.clear();
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _wishlistItems.remove(productId);
    notifyListeners();
  }
}

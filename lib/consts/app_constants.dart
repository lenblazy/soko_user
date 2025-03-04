import 'package:soko_user/models/categories_model.dart';
import 'package:soko_user/services/asset_manager.dart';

class AppConstants {
  static const String imageUrl = "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png";

  static const List<String> bannerImages = [
    AssetManager.banner1,
    AssetManager.banner2,
  ];

  static const List<CategoriesModel> categoriesList = [
    CategoriesModel(id: AssetManager.mobiles, name: "Mobiles", image: AssetManager.mobiles),
    CategoriesModel(id: AssetManager.fashion, name: "fashion", image: AssetManager.fashion),
    CategoriesModel(id: AssetManager.watch, name: "watch", image: AssetManager.watch),
    CategoriesModel(id: AssetManager.book, name: "book", image: AssetManager.book),
    CategoriesModel(id: AssetManager.electronics, name: "electronics", image: AssetManager.electronics),
    CategoriesModel(id: AssetManager.cosmetics, name: "cosmetics", image: AssetManager.cosmetics),
    CategoriesModel(id: AssetManager.shoes, name: "shoes", image: AssetManager.shoes),
  ];



}
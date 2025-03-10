import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/consts/app_constants.dart';
import 'package:soko_user/providers/products_provider.dart';
import 'package:soko_user/widgets/app_name_text.dart';
import 'package:soko_user/widgets/products/ctg_rounded_widget.dart';
import 'package:soko_user/widgets/products/latest_arrival.dart';
import 'package:soko_user/widgets/title_text.dart';

import '../services/asset_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetManager.shoppingBasket),
        ),
        title: AppNameTextWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              SizedBox(
                height: size.height * 0.25,
                child: Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      AppConstants.bannerImages[index],
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: AppConstants.bannerImages.length,
                  pagination: const SwiperPagination(
                    // alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.red,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const TitleTextWidget(label: "Latest Arrival"),
              const SizedBox(height: 15),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => ChangeNotifierProvider.value(
                    value: productsProvider.getProducts[index],
                    child: const LatestArrivalProductWidget(),
                  ),
                ),
              ),
              const TitleTextWidget(label: "Categories"),
              const SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: List.generate(
                  AppConstants.categoriesList.length,
                  (index) {
                    final category = AppConstants.categoriesList[index];
                    return CtgRoundedWidget(
                        image: category.image, name: category.name);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

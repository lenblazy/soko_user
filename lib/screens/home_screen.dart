import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/consts/app_constants.dart';
import 'package:soko_user/widgets/app_name_text.dart';

import '../consts/app_colors.dart';
import '../providers/theme_provider.dart';
import '../services/asset_manager.dart';
import '../widgets/subtitle_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: Column(
          children: [
            const SizedBox(height: 15),
            SizedBox(
              height: size.height * 0.25,
              child: Swiper(
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
          ],
        ),
      ),
    );
  }
}

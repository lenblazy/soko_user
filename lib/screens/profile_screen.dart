import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/screens/inner_screens/orders/orders_screen.dart';
import 'package:soko_user/screens/inner_screens/view_recently.dart';
import 'package:soko_user/screens/inner_screens/wishlist.dart';
import 'package:soko_user/services/my_app_functions.dart';
import 'package:soko_user/widgets/app_name_text.dart';
import 'package:soko_user/widgets/custom_list_tile.dart';
import 'package:soko_user/widgets/title_text.dart';

import '../providers/theme_provider.dart';
import '../services/asset_manager.dart';
import '../widgets/subtitle_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetManager.shoppingBasket),
        ),
        title: AppNameTextWidget(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: TitleTextWidget(
                  label: "Please login to have unlimited access"),
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surface,
                        width: 3,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(label: "Lennox Mwabonje"),
                        SubtitleTextWidget(label: "lenibonje@gmail.com"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                const TitleTextWidget(label: "General"),
                const SizedBox(height: 10),
                CustomListTile(
                  imagePath: AssetManager.orderSvg,
                  text: "All Order",
                  function: () async {
                    await Navigator.of(context)
                        .pushNamed(OrdersScreenFree.routeName);
                  },
                ),
                CustomListTile(
                  imagePath: AssetManager.wishlistSvg,
                  text: "Wishlist",
                  function: () async {
                    await Navigator.pushNamed(
                        context, WishlistScreen.routeName);
                  },
                ),
                CustomListTile(
                  imagePath: AssetManager.recent,
                  text: "Viewed Recently",
                  function: () async {
                    await Navigator.pushNamed(
                      context,
                      ViewedRecentlyScreen.routeName,
                    );
                  },
                ),
                CustomListTile(
                  imagePath: AssetManager.address,
                  text: "Address",
                  function: () {},
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                const TitleTextWidget(label: "Settings"),
                const SizedBox(height: 10),
                SwitchListTile(
                  secondary: Image.asset(AssetManager.theme, height: 34),
                  title: Text(
                    themeProvider.getIsDarkTheme ? "Dark Mode" : "Light Mode",
                  ),
                  value: themeProvider.getIsDarkTheme,
                  onChanged: (value) {
                    themeProvider.setDarkTheme(value);
                  },
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: Text("Login"),
              onPressed: () async {
                await MyAppFunctions.showErrorOrWarningDialog(
                  context: context,
                  subtitle: "Are you sure you want to sign out?",
                  fct: () {},
                  isError: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

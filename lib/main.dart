import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/providers/products_provider.dart';
import 'package:soko_user/providers/theme_provider.dart';
import 'package:soko_user/root_screen.dart';
import 'package:soko_user/screens/auth/forgot_password.dart';
import 'package:soko_user/screens/auth/login_screen.dart';
import 'package:soko_user/screens/inner_screens/view_recently.dart';
import 'package:soko_user/screens/inner_screens/wishlist.dart';
import 'package:soko_user/screens/search_screen.dart';

import 'consts/theme_data.dart';
import 'screens/auth/register_screen.dart';
import 'screens/inner_screens/orders/orders_screen.dart';
import 'screens/inner_screens/product_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop Smart',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          // home: const RootScreen(),
          home: const LoginScreen(),
          // home: const RegisterScreen(),
          routes: {
            ProductDetailsScreen.routeName: (context) =>
                const ProductDetailsScreen(),
            WishlistScreen.routeName: (context) => const WishlistScreen(),
            ViewedRecentlyScreen.routeName: (context) =>
                const ViewedRecentlyScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            RootScreen.routeName: (context) => const RootScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
            SearchScreen.routeName: (context) => const SearchScreen(),
            ForgotPasswordScreen.routeName: (context) =>
                const ForgotPasswordScreen(),
          },
        );
      }),
    );
  }
}

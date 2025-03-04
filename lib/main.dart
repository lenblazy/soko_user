import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/providers/theme_provider.dart';
import 'package:soko_user/root_screen.dart';

import 'consts/theme_data.dart';
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
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Shop Smart',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const RootScreen(),
          routes: {
            ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen(),
          },
        );
      }),
    );
  }
}

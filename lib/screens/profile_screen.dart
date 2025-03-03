import 'package:flutter/material.dart';

import '../services/asset_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetManager.shoppingBasket),
        ),
        title: Text("Profile screen"),
      ),
      body: Center(
        child: Text("Profile Screen"),
      ),
    );
  }
}

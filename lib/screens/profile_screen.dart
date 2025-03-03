import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/bag/shopping_cart.png"),
        ),
        title: Text("Profile screen"),
      ),
      body: Center(
        child: Text("Profile Screen"),
      ),
    );
  }
}

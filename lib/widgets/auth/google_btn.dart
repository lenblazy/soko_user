import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      icon: const Icon(
        Ionicons.logo_google,
        color: Colors.red,
      ),
      label: Text(
        "Sign In with Google",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onPressed: () async {},
    );
  }
}

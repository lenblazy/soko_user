import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:soko_user/widgets/subtitle_text.dart';

import '../services/asset_manager.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.imagePath, required this.text, required this.function,});

  final String imagePath, text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(
        imagePath,
        height: 34,
      ),
      trailing: Icon(IconlyLight.arrowRight),
    );
  }
}

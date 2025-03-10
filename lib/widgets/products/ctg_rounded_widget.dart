import 'package:flutter/material.dart';
import 'package:soko_user/screens/search_screen.dart';
import 'package:soko_user/widgets/subtitle_text.dart';

class CtgRoundedWidget extends StatelessWidget {
  const CtgRoundedWidget({
    super.key,
    required this.image,
    required this.name,
  });

  final String image, name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SearchScreen.routeName, arguments: name);
      },
      child: Column(
        children: [
          Image.asset(image, height: 50, width: 50),
          const SizedBox(height: 5),
          SubtitleTextWidget(label: name),
        ],
      ),
    );
  }
}

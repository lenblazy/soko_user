import 'package:flutter/material.dart';
import 'package:soko_user/widgets/subtitle_text.dart';
import 'package:soko_user/widgets/title_text.dart';


class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  final String imagePath, title, subtitle, buttonText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 50),
        Image.asset(
          imagePath,
          width: double.infinity,
          height: size.height * 0.35,
        ),
        const SizedBox(height: 20),
        TitleTextWidget(
          label: "Whoops",
          fontSize: 40,
          color: Colors.red,
        ),
        const SizedBox(height: 20),
        SubtitleTextWidget(
          label: title,
        ),
        const SizedBox(height: 20),
        SubtitleTextWidget(
          label: subtitle,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          onPressed: () {},
          child: Text(buttonText),
        )
      ],
    );
  }
}

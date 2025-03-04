import 'package:flutter/material.dart';

class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget({
    super.key,
    required this.label,
    this.color,
    this.fontSize = 18,
    this.textDecoration = TextDecoration.none,
    this.fontStyle,
  });

  final String label;
  final double fontSize;
  final Color? color;
  final TextDecoration textDecoration;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontStyle: fontStyle,
        decoration: textDecoration,
        color: color,
        fontSize: 14,
      ),
    );
  }
}

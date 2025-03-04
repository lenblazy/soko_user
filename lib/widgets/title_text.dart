import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.label,
    this.color,
    this.maxLines,
    this.fontSize = 18,
  });

  final String label;
  final double fontSize;
  final Color? color;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      label,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}

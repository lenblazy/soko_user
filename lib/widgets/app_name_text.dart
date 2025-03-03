import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soko_user/widgets/title_text.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 12),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: const TitleTextWidget(label: "Shop Smart", fontSize: 20,),
    );
  }
}

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:soko_user/widgets/subtitle_text.dart';

import '../../consts/app_constants.dart';
import '../title_text.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width * 0.45,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: AppConstants.imageUrl,
                height: size.width * 0.28,
                width: size.width * 0.24,
              ),
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  Text(
                    "Title" * 10,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(IconlyLight.heart),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_shopping_cart_outlined),
                        ),
                      ],
                    ),
                  ),
                  const FittedBox(
                    child: SubtitleTextWidget(
                      label: "1550.00\$",
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

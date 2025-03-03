import 'package:flutter/material.dart';
import 'package:soko_user/widgets/subtitle_text.dart';
import 'package:soko_user/widgets/title_text.dart';

class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TitleTextWidget(
                        label: "Total (6 products / 9 items)",
                      ),
                    ),
                    SubtitleTextWidget(
                      label: "16.0 \$",
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Checkout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

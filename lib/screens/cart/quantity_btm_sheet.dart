import 'package:flutter/material.dart';
import 'package:soko_user/widgets/subtitle_text.dart';

class QuantityBtmSheetWidget extends StatelessWidget {
  const QuantityBtmSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SubtitleTextWidget(
                        label: "$index",
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

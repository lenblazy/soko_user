import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/models/cart_model.dart';
import 'package:soko_user/providers/cart_provider.dart';
import 'package:soko_user/widgets/subtitle_text.dart';

class QuantityBtmSheetWidget extends StatelessWidget {
  const QuantityBtmSheetWidget({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
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
                  onTap: () {
                    cartProvider.updateQty(
                        productId: cartModel.productId, qty: index + 1);
                    Navigator.pop(context);
                  },
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

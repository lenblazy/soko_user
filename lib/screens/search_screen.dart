import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_user/services/asset_manager.dart';
import 'package:soko_user/widgets/products/product_widget.dart';

import '../providers/products_provider.dart';
import '../widgets/title_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetManager.shoppingBasket),
          ),
          title: const TitleTextWidget(label: "Search products"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // setState(() {
                      controller.clear();
                      // });
                      FocusScope.of(context).unfocus();
                    },
                    child: Icon(Icons.clear),
                  ),
                ),
                onSubmitted: (value) {
                  debugPrint("Value of text $value");
                  debugPrint("Value of conteoller text ${controller.text}");
                },
              ),
              const SizedBox(height: 15),
              Expanded(
                child: DynamicHeightGridView(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  builder: (context, index) {
                    return ChangeNotifierProvider.value(
                        value: productsProvider.getProducts[index],
                        child: const ProductWidget());
                  },
                  itemCount: productsProvider.getProducts.length,
                  crossAxisCount: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

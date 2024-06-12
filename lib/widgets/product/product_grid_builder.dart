import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/widgets/product/product_item.dart';
import 'package:provider/provider.dart';

import '../../providers/products_provider.dart';

class ProductGridBuilder extends StatelessWidget {
  const ProductGridBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: products.elementAt(i),
        child: const ProductItem(),
      ),
    );
  }
}

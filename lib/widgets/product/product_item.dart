import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/screens/deatails_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context,listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            productData.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(
                builder: (context) => const ProductDetailsWidget(),
            settings: RouteSettings(arguments: productData.id))
            );
          },
          child: Image.network(
            productData.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

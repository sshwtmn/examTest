import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/styled_button.dart';
import '../../components/styled_text.dart';
import '../../providers/product.dart';
import '../../providers/products_provider.dart';

class CreateProductWidget extends StatefulWidget {
  const CreateProductWidget({super.key});

  @override
  State<CreateProductWidget> createState() => _CreateProductWidgetState();
}

class _CreateProductWidgetState extends State<CreateProductWidget> {
  final productIdController = TextEditingController();
  final productPriceController = TextEditingController();
  final productTitleController = TextEditingController();
  final productImageUrlController = TextEditingController();
  final productDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<Products>(context, listen: false).addProduct(Product(
      id: productIdController.text,
      price: productPriceController.text,
      title: productTitleController.text,
      imageUrl: productImageUrlController.text,
      description: productDescriptionController.text,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const StyledText("Admin Panel"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: productIdController,
              decoration:
                  const InputDecoration(label: StyledText("Product ID")),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: productPriceController,
              decoration:
                  const InputDecoration(label: StyledText("Product Price")),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: productTitleController,
              decoration:
                  const InputDecoration(label: StyledText("Product Title")),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: productImageUrlController,
              decoration:
                  const InputDecoration(label: StyledText("Product ImageUrl")),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: productDescriptionController,
              decoration: const InputDecoration(
                  label: StyledText("Product Description")),
            ),
            const SizedBox(
              height: 50,
            ),
            StyledButton(
                onPressed: () {}, child: const StyledText('Create Product'))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/styled_button.dart';
import '../../components/styled_text.dart';
import '../../providers/product.dart';
import '../../providers/products_provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _idController = TextEditingController();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _descriptionController = TextEditingController();

  void addProduct() {
    Provider.of<Products>(context, listen: false)
        .addProduct(Product(
      id: DateTime.now().toString(),
      title: _titleController.text.trim(),
      imageUrl: _imageUrlController.text.trim(),
      price: _priceController.text.trim(),
      description: _descriptionController.text.trim(),

    ));

  }
    // void submit(){
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[700],
          title: const StyledText('Admin Panel'),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _titleController,
                  decoration: const InputDecoration(
                      label: StyledText('title')),),
                const SizedBox(height: 15,),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _priceController,
                  decoration: const InputDecoration(
                      label: StyledText('price')),),
                const SizedBox(height: 15,),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _imageUrlController,
                  decoration: const InputDecoration(
                      label: StyledText('imageUrl')),),
                const SizedBox(height: 15,),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      label: StyledText('description')),),
                const SizedBox(height: 45,),
                StyledButton(
                    onPressed: () {
                      addProduct();
                    },
                    child: const StyledText('Submit'))
              ],
            ),
          ),
        ),
      );
    }
  }


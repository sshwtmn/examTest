import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/providers/booking.dart';
import 'package:kati_masterclass_app/services/auth_service.dart';
import 'package:kati_masterclass_app/services/firestore_service.dart';

import 'package:provider/provider.dart';
import '../components/styled_button.dart';
import '../components/styled_text.dart';
import '../providers/products_provider.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({super.key});

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {


  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final product = Provider.of<Products>(context).findById(productId);
    final authService = AuthService();
    final currentUserEmail = authService.getCurrentUserEmail();

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 450,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '\$${product.price}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              product.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          StyledButton(
              onPressed: () {
                final Future<DocumentReference<Booking>> bookService;
                bookService = FireStoreService.bookingsRef.add(Booking(
                    id: DateTime.now().toString(),
                    userEmail: currentUserEmail,
                    productId: product.id,
                    price: product.price,
                    imageUrl: product.imageUrl));
              },
              child: const StyledText('Book Now')),
          const SizedBox(
            height: 25,
          )
        ]),
      ),
    );
  }
}

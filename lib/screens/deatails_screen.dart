import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/models/booking.dart';
import 'package:kati_masterclass_app/services/auth_service.dart';
import 'package:kati_masterclass_app/services/firestore_service.dart';
import 'package:kati_masterclass_app/widgets/date_and_time/date_picker_widget.dart';
import 'package:kati_masterclass_app/widgets/date_and_time/time_picker_widget.dart';
import 'package:provider/provider.dart';

import '../components/styled_button.dart';
import '../components/styled_text.dart';
import '../providers/bookings.dart';
import '../providers/products_provider.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({super.key});

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  void submit() {


  }




  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final products = Provider.of<Products>(context).findById(productId);
    final authService = AuthService();
    final currentUserEmail = authService.getCurrentUserEmail();






    return Scaffold(
      appBar: AppBar(
        title: Text(products.title),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: 450,
          width: double.infinity,
          child: Image.network(
            products.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '\$${products.price}',
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
            products.description,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
            const SizedBox(height: 50,),
            const DatePickerWidget(),
            const SizedBox(height: 15,),
            const TimePickerWidget(),
            const SizedBox(height: 50,),
            StyledButton(
                onPressed: () {
                  final bookService;
                  bookService = FireStoreService.bookingsRef.add(
                      Booking(id: products.id, userEmail: currentUserEmail, productId: products.id, price: products.price));
                },
                child: const StyledText('Book Now')),
            const SizedBox(height: 25,)
      ]
          ),

      ),
    );
  }
}

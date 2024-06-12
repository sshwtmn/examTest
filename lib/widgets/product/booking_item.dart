import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/models/booking.dart';
import 'package:provider/provider.dart';

import '../../providers/product.dart';


class BookingItemWidget extends StatelessWidget {
  const BookingItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingData = Provider.of<Booking>(context,listen: false);
    final productData = Provider.of<Product>(context,listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            bookingData.price,
            textAlign: TextAlign.center,
          ),
        ),
        child: Image.network(
          productData.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

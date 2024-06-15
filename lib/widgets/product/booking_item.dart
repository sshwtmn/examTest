import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/providers/booking.dart';
import 'package:provider/provider.dart';

import '../../providers/bookings_provider.dart';

class BookingItemWidget extends StatelessWidget {
  const BookingItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingData = Provider.of<Booking>(context,listen: false);
    final bookings = Provider.of<Bookings>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: IconButton(
            icon: const Icon(Icons.delete),
          onPressed: () {
          bookings.deleteBooking(bookingData);},
          ),
          backgroundColor: Colors.black87,
          title: Text('Price: ${bookingData.price}€',
            textAlign: TextAlign.center,
          ),
        ),
        child: Image.network(
          bookingData.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

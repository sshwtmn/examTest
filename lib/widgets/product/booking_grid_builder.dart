import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/providers/bookings_provider.dart';
import 'package:kati_masterclass_app/widgets/product/booking_item.dart';
import 'package:provider/provider.dart';


class BookingGridBuilder extends StatefulWidget {
  const BookingGridBuilder({super.key});

  @override
  State<BookingGridBuilder> createState() => _BookingGridBuilderState();
}

class _BookingGridBuilderState extends State<BookingGridBuilder> {


  @override
  Widget build(BuildContext context) {
    final bookingsData = Provider.of<Bookings>(context);
    final booking = bookingsData.items;
    print(bookingsData.items.length);

    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: booking.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 4 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: booking.elementAt(i),
        child: const BookingItemWidget(),
      ),
    );
  }
}

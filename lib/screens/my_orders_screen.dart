import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/widgets/product/booking_item.dart';
import 'package:provider/provider.dart';

import '../providers/bookings.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    final bookingData = Provider.of<Bookings>(context);
    final bookings = bookingData.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: bookings.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: bookings.elementAt(i), child: const BookingItemWidget()),
      ),
    );
  }
}

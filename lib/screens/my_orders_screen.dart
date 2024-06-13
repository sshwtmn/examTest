import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/widgets/product/booking_grid_builder.dart';
import 'package:provider/provider.dart';

import '../providers/bookings_provider.dart';



class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {


  @override
  void initState() {
    Provider.of<Bookings>(context,listen: false).fetchAllBookings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        centerTitle: true,
      ),
      body:  const BookingGridBuilder()
    );
  }
}

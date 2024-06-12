import 'package:flutter/material.dart';

import '../models/booking.dart';
import '../services/firestore_service.dart';

class Bookings with ChangeNotifier {
    final List<Booking> _items = [];

  List<Booking> get items {
    return [..._items];
  }
   void addBooking(Booking booking){
     FireStoreService.addBooking(booking);
   }

   void fetchAllBookings() async {
     if(items.isEmpty){
       final snapshot = await FireStoreService.getAllBookings();

       for(var doc in snapshot.docs){
         _items.add(doc.data());
       }
       notifyListeners();
     }
   }


}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/firestore_service.dart';
import 'booking.dart';

class Bookings with ChangeNotifier {
  final List<Booking> _items = [];


  List<Booking> get items {
    return [..._items];
  }

  void addBooking(Booking booking) async {
    await FireStoreService.addBooking(booking);

    _items.add(booking);
    notifyListeners();
  }

  void fetchAllBookings() async {
      _items.clear();
      final snapshot = await FireStoreService.getAllBookings();
      for (var doc in snapshot.docs) {
        if (doc
            .data()
            .userEmail == FirebaseAuth.instance.currentUser?.email) {
          _items.add(doc.data());
        }
        notifyListeners();
      }
    }
    void deleteBooking(Booking booking) async {
    await FireStoreService.deleteBooking(booking);

    _items.remove(booking);
    notifyListeners();
    }

  }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Booking with ChangeNotifier{
  final String id;
  final String? userEmail;
  final String productId;
  final String price;

  Booking({
    required this.id,
    required this.userEmail,
    required this.productId,
    required this.price,
  });


  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'userEmail': userEmail,
      'productId': productId,
      'price': price,
    };
  }

  factory Booking.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {

    final data = snapshot.data()!;

    Booking booking = Booking(
      id: snapshot.id,
      userEmail: data['userEmail'],
      productId: data['productId'],
      price: data['price'],
    );
    return booking;
  }
}

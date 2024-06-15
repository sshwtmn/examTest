import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/booking.dart';
import '../providers/product.dart';

class FireStoreService {

  static final productsRef = FirebaseFirestore.instance
      .collection('products')
      .withConverter(
      fromFirestore: Product.fromFirestore,
      toFirestore: (Product p, _) => p.toFirestore()
  );

  static Future<void> addProduct(Product product) async {
    await productsRef.doc(product.id).set(product);
  }
  static Future<QuerySnapshot<Product>> getAllProducts(){
    return productsRef.get();
  }


  static final bookingsRef = FirebaseFirestore.instance
      .collection('bookings')
      .withConverter(
      fromFirestore: Booking.fromFirestore,
      toFirestore: (Booking b, _) => b.toFirestore()
  );

  static Future<void> addBooking(Booking booking) async {
    await bookingsRef.doc(booking.id).set(booking);
  }
  static Future<QuerySnapshot<Booking>> getAllBookings() {
    return bookingsRef.get();
  }

  static Future<void> deleteBooking(Booking booking) async {
    await bookingsRef.doc(booking.id).delete();
  }

}
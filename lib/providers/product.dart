import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  Product({required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl});

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl
    };
  }

  factory Product.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions  ? options)
    {
    final data = snapshot.data()!;

    Product product = Product(
    id: snapshot.id,
    title: data['title'],
    description: data['description'],
    price: data['price'],
    imageUrl: data['imageUrl']
    );
    return product;
    }
  }





import 'package:flutter/material.dart';
import 'package:kati_masterclass_app/services/firestore_service.dart';

import 'product.dart';

class Products with ChangeNotifier {
    final List<Product> _items = [];

    List<Product> get items {
      return [..._items];
    }

    Product findById(String id){
      return _items.firstWhere((prod) => prod.id == id);
    }
    
    void addProduct(Product product){
      FireStoreService.addProduct(product);
    }

    void fetchAllProducts() async {
      if(items.isEmpty){
        final snapshot = await FireStoreService.getAllProducts();

        for(var doc in snapshot.docs){
          _items.add(doc.data());
        }
        notifyListeners();
      }
    }
}
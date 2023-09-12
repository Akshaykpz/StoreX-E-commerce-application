import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

// Reference to the Firestore collection
CollectionReference productsCollection =
    FirebaseFirestore.instance.collection('products');

// Add data to Firestore
Future<void> addProduct(String productName, double productPrice) async {
  try {
    await productsCollection.add({
      'p_name': productName,
      'p_price': productPrice,
    });
  } catch (e) {
    log('Error adding product: $e');
  }
}

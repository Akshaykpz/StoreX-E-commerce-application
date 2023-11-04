import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataAdd {
  // Future<void> checOutitems(
  //   String paymentId,
  // ) async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   await FirebaseFirestore.instance
  //       .collection('checkout')
  //       .doc(user!.email)
  //       .collection('orderitems')
  //       .add({
  //     'payment_id': paymentId,
  //     // 'product_reference': productReference,
  //   });
  // }

  final firestore = FirebaseFirestore.instance;

  Future<void> checOutitems(
    String paymentId,
    DocumentReference? productReference,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    await firestore
        .collection('checkout')
        .doc(user!.email)
        .collection('orderitems')
        .add({
      'payment_id': paymentId,
      'product_reference':
          productReference, // Optionally add product reference here
    });
  }

// final firestore = FirebaseFirestore.instance;
// Future<String?> findDocumentIdByCategory(String checkout) async {
//   String? id;
//   log('Called findDocumentIdByCategory with category: $checkout');

//   try {
//     final QuerySnapshot querySnapshot = await firestore
//         .collection('checkout')
//         .where('cat_name', isEqualTo: checkout)
//         .get();

//     if (querySnapshot.docs.isNotEmpty) {
//       // Return the document ID of the first matching document
//       log('Found matching document with ID: ${querySnapshot.docs.first.id}');
//       id = querySnapshot.docs.first.id;
//     } else {
//       log('No matching document found for category: $checkout');
//     }
//   } catch (error) {
//     log('Error in findDocumentIdByCategory: $error');
//   }
//   print(id);
//   return id;
// }
}

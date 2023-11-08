import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
Future<String?> findDocumentIdByCategory(String category) async {
  String? id;
  log('Called findDocumentIdByCategory with category: $category');

  try {
    final QuerySnapshot querySnapshot = await firestore
        .collection('category')
        .where('cat_name', isEqualTo: category)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Return the document ID of the first matching document
      log('Found matching document with ID: ${querySnapshot.docs.first.id}');
      id = querySnapshot.docs.first.id;
    } else {
      log('No matching document found for category: $category');
    }
  } catch (error) {
    log('Error in findDocumentIdByCategory: $error');
  }

  return id;
}

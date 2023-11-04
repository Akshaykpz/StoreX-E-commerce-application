import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseService();
});

class FirebaseService {
  final CollectionReference _itemsCollection =
      FirebaseFirestore.instance.collection('products');

  // Future<List<QueryDocumentSnapshot>> searchItems(String query) async {
  //   if (query.isEmpty) {
  //     final snapshot = await _itemsCollection.get();
  //     return snapshot.docs;
  //   } else {
  //     final snapshot =
  //         await _itemsCollection.where('p_name', isEqualTo: query).get();
  //     return snapshot.docs;
  //   }
  // }
  Future<List<QueryDocumentSnapshot>> searchItems(String query) async {
    if (query.isEmpty) {
      final snapshot = await _itemsCollection.get();
      return snapshot.docs;
    } else {
      final startValue = query[0];

      final endValue = query[0].substring(0, query[0].length - 1) +
          String.fromCharCode(query[0].codeUnitAt(query[0].length - 1) + 1);
      final snapshot = await _itemsCollection
          .where('p_name', isGreaterThanOrEqualTo: startValue.toLowerCase())
          .where('p_name', isLessThan: endValue.toLowerCase())
          .get();
      return snapshot.docs;
    }
  }
}

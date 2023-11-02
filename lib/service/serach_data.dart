import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseService();
});

class FirebaseService {
  final CollectionReference _itemsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot>> searchItems(String query) async {
    if (query.isEmpty) {
      final snapshot = await _itemsCollection.get();
      return snapshot.docs;
    } else {
      final snapshot =
          await _itemsCollection.where('p_name', isEqualTo: query).get();
      return snapshot.docs;
    }
  }
}

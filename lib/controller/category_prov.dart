import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = StreamProvider<List<DocumentSnapshot<Object?>>>((ref) {
  final categoryRef =
      FirebaseFirestore.instance.collection('category').snapshots();
  return categoryRef.map((event) {
    return event.docs;
  });
});

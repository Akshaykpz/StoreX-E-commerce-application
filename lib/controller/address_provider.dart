import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressdataList = StreamProvider<List<DocumentSnapshot<Object?>>>((ref) {
  final address = FirebaseFirestore.instance.collection('address');

  return address.snapshots().map((querySnapshot) {
    return querySnapshot.docs;
  });
});

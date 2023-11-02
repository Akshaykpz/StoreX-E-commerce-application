import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userprovider = StreamProvider<List<DocumentSnapshot<Object?>>>((ref) {
  final userref =
      FirebaseFirestore.instance.collection('userprofile').snapshots();
  return userref.map((event) {
    return event.docs;
  });
});

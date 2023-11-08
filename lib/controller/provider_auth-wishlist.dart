// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishlistContentsProvider =
    StreamProvider<List<DocumentSnapshot<Object?>>>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userId = user.email;
    final wishListReference =
        FirebaseFirestore.instance.collection('wishlist').doc(userId);
    final cartItemsReference = wishListReference.collection('items');

    return cartItemsReference.snapshots().map((querySnapshot) {
      return querySnapshot.docs;
    });
  } else {
    // Handle the case when the user is not signed in or user is null
    return Stream.value([]);
  }
});

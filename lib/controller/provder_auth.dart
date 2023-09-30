import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/service/auth_service.dart';

final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authchange;
});

final cartContentsProvider =
    StreamProvider<List<DocumentSnapshot<Object?>>>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userId = user.email;
    final cartReference =
        FirebaseFirestore.instance.collection('cart').doc(userId);
    final cartItemsReference = cartReference.collection('items');

    return cartItemsReference.snapshots().map((querySnapshot) {
      return querySnapshot.docs;
    });
  } else {
    // Handle the case when the user is not signed in or user is null
    return Stream.value([]);
  }
});

final productList = StreamProvider<List<DocumentSnapshot<Object?>>>((ref) {
  final productData = FirebaseFirestore.instance.collection('products');

  return productData.snapshots().map((querySnapshot) {
    return querySnapshot.docs;
  });
});

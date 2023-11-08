import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> deleteCategory(String categoryid) async {
  try {
    await FirebaseFirestore.instance
        .collection('category')
        .doc(categoryid)
        .delete();
  } catch (e) {
    // Rethrow the error so it can be handled elsewhere if needed.
    rethrow;
  }
}

Future<void> deleteCart(
  DocumentReference reference,
) async {
  final cartUser = FirebaseAuth.instance.currentUser;

  if (cartUser != null) {
    try {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(cartUser.email)
          .collection('items')
          .where('product_reference', isEqualTo: reference)
          .get()
          .then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          doc.reference.delete(); // Delete the document
        }
      });
      // ignore: empty_catches
    } catch (e) {}
  } else {}
}

Future<void> deleteproudct(String proudctId) async {
  try {
    await FirebaseFirestore.instance.collection('products').doc().delete();
    // ignore: empty_catches
  } catch (e) {}
}

Future<void> deletewishlsit(
  DocumentReference referen,
) async {
  // ignore: non_constant_identifier_names
  final User = FirebaseAuth.instance.currentUser;

  if (User != null) {
    try {
      await FirebaseFirestore.instance
          .collection('wishlist')
          .doc(User.email)
          .collection('items')
          .where('product_referce', isEqualTo: referen)
          .get()
          .then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          doc.reference.delete();
        }
      });
      // ignore: empty_catches
    } catch (e) {}
  } else {}
}

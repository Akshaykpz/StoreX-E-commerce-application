import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> deleteCategory(String categoryid) async {
  try {
    await FirebaseFirestore.instance
        .collection('category')
        .doc(categoryid)
        .delete();
    print('Successfully deleted category with ID: $categoryid');
  } catch (e) {
    print('Error deleting category: $e');
    // Rethrow the error so it can be handled elsewhere if needed.
    throw e;
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
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete(); // Delete the document
        });
      });
      print('Item removed from cart successfully.');
    } catch (e) {
      print('Error removing item from cart: $e');
    }
  } else {
    print('User is not authenticated.');
  }
}

Future<void> deleteproudct(String proudctId) async {
  try {
    await FirebaseFirestore.instance.collection('products').doc().delete();
    print('delete sucessfully');
  } catch (e) {
    print('Error deleting product: $e');
  }
}

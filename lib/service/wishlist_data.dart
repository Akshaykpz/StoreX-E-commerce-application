import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemAdd {
  Future<void> addWishlistItem(DocumentReference referenceId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Check if the item already exists in the user's wishlist
      final itemExists = await FirebaseFirestore.instance
          .collection('wishlist')
          .doc(user.email)
          .collection('items')
          .where('product_referce', isEqualTo: referenceId)
          .get()
          .then((querySnapshot) => querySnapshot.docs.isNotEmpty);

      if (itemExists) {
        // Show an alert or snackbar to inform the user that the item is already in the wishlist
        print('Item is already in the wishlist.');
      } else {
        try {
          await FirebaseFirestore.instance
              .collection('wishlist')
              .doc(user.email)
              .collection('items')
              .add({
            'product_referce': referenceId,
          });
          print('Item added to wishlist successfully.');
        } catch (e) {
          print('Error adding item to wishlist: $e');
        }
      }
    } else {
      print('User is not authenticated.');
    }
  }

  Future<void> addCart(DocumentReference reference) async {
    final cartuser = FirebaseAuth.instance.currentUser;
    if (cartuser != null) {
      try {
        await FirebaseFirestore.instance
            .collection('cart')
            .doc(cartuser.email)
            .collection('items')
            .add({
          'product_reference': reference,
        });
        print('Item added to cartitem successfully.');
      } catch (e) {
        print('Error adding item to cart: $e');
      }
    } else {
      print('User is not authenticated.');
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemAdd {
  Future<void> addWishlistItem(DocumentReference referenceId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('wishlist')
            .doc(user.email) // Use user's email as the document ID
            .collection('items')
            .doc() // Automatically generate a unique document ID
            .set({
          'product_referce': referenceId,
        });
        print('Item added to wishlist successfully.');
      } catch (e) {
        print('Error adding item to wishlist: $e');
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

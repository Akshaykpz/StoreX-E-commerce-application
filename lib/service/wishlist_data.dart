import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

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
        EasyLoading.dismiss().then((value) {
          EasyLoading.showToast('item is already exist',
              maskType: EasyLoadingMaskType.clear,
              toastPosition: EasyLoadingToastPosition.top);
        });
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
          // ignore: empty_catches
        } catch (e) {}
      }
    } else {}
  }

  Future<void> addCart(
    DocumentReference reference,
  ) async {
    final cartuser = FirebaseAuth.instance.currentUser;
    if (cartuser != null) {
      final itemsexits = await FirebaseFirestore.instance
          .collection('cart')
          .doc(cartuser.email)
          .collection('items')
          .where('product_reference', isEqualTo: reference)
          .get()
          .then((value) => value.docs.isNotEmpty);

      if (itemsexits) {
        EasyLoading.dismiss().then((value) {
          EasyLoading.showToast('item is already exist',
              maskType: EasyLoadingMaskType.clear,
              toastPosition: EasyLoadingToastPosition.top);
        });
        print('cart alredaya added');
      } else {
        try {
          await FirebaseFirestore.instance
              .collection('cart')
              .doc(cartuser.email)
              .collection('items')
              .add({'product_reference': reference, 'itemCount': 1});
          // ignore: empty_catches
        } catch (e) {}
      }
    } else {}
  }

  Future<void> updatCount(String id, int itemCount) async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(user!.email)
          .collection('items')
          .doc(id)
          .update({'itemCount': itemCount});
      // ignore: empty_catches
    } catch (e) {}
  }
}

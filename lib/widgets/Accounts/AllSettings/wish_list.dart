import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/find_category.dart';
import 'package:giltezy_2ndproject/service/wish_list.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () {
        showMultiActionSnackbar(context);
        // addWishlistItem('your prouct here');
        // Call the addProduct function to add data
        // addcategory(categoryimage: 'haii', categoryname: 'hello');
      },
      child: const Text('Add Product'),
    )));
  }
}

Future<void> addWishlistItem(String productId) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      await FirebaseFirestore.instance
          .collection('wishlist')
          .doc(user.email) // Use user's email as the document ID
          .collection('items')
          .doc() // Automatically generate a unique document ID
          .set({
        'product_id': productId,
      });
      print('Item added to wishlist successfully.');
    } catch (e) {
      print('Error adding item to wishlist: $e');
    }
  } else {
    print('User is not authenticated.');
  }
}

void showMultiActionSnackbar(BuildContext context) {
  final snackBar = const SnackBar(
    content: Text('This is a multi-action Snackbar.'),
    duration: Duration(seconds: 1),
  );

  // Show the Snackbar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

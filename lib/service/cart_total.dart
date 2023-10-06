

// final wishlistProvider = StateProvider<List<String>>((ref) => []);


// final cartProvider = StateProvider<List<String>>((ref) => []);


// void addToWishlist(String productId) {
//   final wishlist = ref.read(wishlistProvider);
//   if (!wishlist.state.contains(productId)) {
//     // Add the product to Firestore under the user's wishlist collection
//     // You may also want to add more product details to Firestore
//     Firestore.instance.collection('users').document(userId).collection('wishlist').add({
//       'productId': productId,
//     });
//     // Update the local state
//     wishlist.state.add(productId);
//   } else {
//     // Show a popup indicating that the product is already in the wishlist
//     // You can use a package like 'fluttertoast' or 'flushbar' for popups
//     showToast('Product is already in your wishlist');
//   }
// }

// // Function to add a product to the user's cart (similar to addToWishlist)
// void addToCart(String productId) {
//   final cart = ref.read(cartProvider);
//   // Similar logic as addToWishlist
// }

// // Usage in your UI
// final wishlist = useProvider(wishlistProvider);
// final cart = useProvider(cartProvider);

// // Display the wishlist and cart data in your UI

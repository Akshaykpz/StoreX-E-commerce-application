import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteCategory(String categoryid) async {
  try {
    await FirebaseFirestore.instance
        .collection('category')
        .doc(categoryid)
        .delete();
    print('sucessfully deleted');
  } catch (e) {
    print('Error deleting category: $e');
  }
}

Future<void> deleteCart(String cartId) async {
  try {
    await FirebaseFirestore.instance.collection('cart').doc(cartId).delete();
    print('sucessfully deleted');
  } catch (e) {
    print('Error deleting category: $e');
  }
}

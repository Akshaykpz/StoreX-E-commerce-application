import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteproudct(String proudctId) async {
  try {
    await FirebaseFirestore.instance.collection('products').doc().delete();
    print('delete sucessfully');
  } catch (e) {
    print('Error deleting product: $e');
  }
}

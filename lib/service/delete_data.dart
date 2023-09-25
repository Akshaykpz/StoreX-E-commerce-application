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

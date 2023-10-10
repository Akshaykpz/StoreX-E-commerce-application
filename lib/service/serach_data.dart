import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giltezy_2ndproject/service/proudcts.dart';

Future<List<Product>> searchDatabase(
    String searchText, FirebaseFirestore firestore) async {
  final querySnapshot = await firestore
      .collection('your_collection_name')
      .where('field_to_search', isEqualTo: searchText)
      .get();

  final results = querySnapshot.docs.map((doc) {
    // Map Firestore data to your data model
    return Product.fromFirestore(doc.data() as DocumentSnapshot<Object?>);
  }).toList();

  return results;
}

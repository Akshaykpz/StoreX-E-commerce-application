import 'package:cloud_firestore/cloud_firestore.dart';

class CartTotal {
  double calculateTotal(
      {required List<DocumentSnapshot<Object?>> cartData,
      required List<DocumentSnapshot<Object?>> product}) {
    double totalprice = 0;
    for (final cartitem in cartData) {
      final cartDataMap = cartitem.data() as Map<String, dynamic>;
      final productRef = cartDataMap['product_reference'] as DocumentReference;
      final itemCount = cartDataMap['itemCount'] as int;

      final matchingProduct =
          product.firstWhere((element) => element.reference == productRef);
      final productpr = matchingProduct['p_price'];
      final productprice = double.parse(productpr.toString());
      totalprice += productprice * itemCount;
    }
    return totalprice;
  }
}

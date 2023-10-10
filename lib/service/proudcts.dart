import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String price;
  final String? description;

  Product({
    required this.name,
    required this.price,
    this.description,
  });

  // Define a factory constructor to create a Product object from a DocumentSnapshot
  factory Product.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Product(
      name: data['name'] ?? '', // Provide a default value if 'name' is missing
      price:
          data['price'] ?? '', // Provide a default value if 'price' is missing
      description: data['description'], // 'description' can be nullable
    );
  }
}

class Product {
  final String name;
  final String price;
  final String? description;

  // final String imageUrl; // Add an image URL field

  Product({
    required this.name,
    required this.price,
    this.description,
    // required this.imageUrl,
  });
}

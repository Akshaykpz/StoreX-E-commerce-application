import 'package:flutter/material.dart';

class CartItemsviews extends StatelessWidget {
  final String imagePath; // Change the parameter type to String
  final String price;
  final String descriptions;

  const CartItemsviews({
    required this.descriptions,
    required this.imagePath, // Change the parameter type here
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        height: 100,
        width: 380,
        child: Card(
          elevation: 2.0,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 90,
                height: 90,
                child: Image.asset(
                  imagePath, // Use the asset path here
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(price),
                      SizedBox(height: 8),
                      Text(
                        descriptions,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Cart/counter_cart.dart';

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
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7), // Rounded corners
          side: BorderSide(
              color: Colors.black26, width: 2), // Border color and width
        ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      descriptions,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CounterCart()
          ],
        ),
      ),
    );
  }
}

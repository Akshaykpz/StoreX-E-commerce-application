import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Cart/cart_viewitems.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CartItemsviews(
            descriptions: 'hahha',
            imagePath: 'assets/images/reallogo.png',
            price: '200'),
        SizedBox(
          height: 10,
        ),
        CartItemsviews(
            descriptions: 'hahha',
            imagePath: 'assets/images/reallogo.png',
            price: '200'),
        SizedBox(
          height: 10,
        ),
        CartItemsviews(
            descriptions: 'hahha',
            imagePath: 'assets/images/reallogo.png',
            price: '200'),
        SizedBox(
          height: 10,
        ),
        CartItemsviews(
            descriptions: 'hahha',
            imagePath: 'assets/images/reallogo.png',
            price: '200'),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

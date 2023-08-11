import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  final Image itemimage;
  const CartItems({super.key, required this.itemimage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Image.asset(itemimage as String)],
      ),
    );
  }
}

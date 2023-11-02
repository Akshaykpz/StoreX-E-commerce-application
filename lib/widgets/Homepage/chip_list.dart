import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/chip.dart'; // Import other necessary dependencies

class ItemsGrid extends StatefulWidget {
  const ItemsGrid({super.key});

  @override
  State<ItemsGrid> createState() => _ItemsGridState();
}

class _ItemsGridState extends State<ItemsGrid> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Chipadd(
            
            text: 'Apple',
            image: 'assets/images/Apple-Logo.png',
          ),
          Chipadd(
            text: 'Xiomi',
            image: 'assets/images/Xiaomi-logo.jpg',
          ),
          Chipadd(

            text: 'Oneplus',
            image: 'assets/images/OnePlus-logo.jpg',
          ),
          Chipadd(
            text: 'Huwei',
            image: 'assets/images/Huawei-logo.jpg',
          ),
        ],
      ),
    );
  }
}

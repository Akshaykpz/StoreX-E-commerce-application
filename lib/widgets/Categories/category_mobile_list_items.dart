import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/chip.dart'; // Import other necessary dependencies

class ItemsGridss extends StatelessWidget {
  const ItemsGridss({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Chipadd(
            label: 'Apple',
            image: 'assets/images/Apple-Logo.png',
            isSelected: true,
            onChipTap: () {}, // This chip will be initially selected and red
          ),
          Chipadd(
            label: 'Xiomi',
            image: 'assets/images/Xiaomi-logo.jpg',
            onChipTap: () {},
          ),
          Chipadd(
            label: 'Oneplus',
            image: 'assets/images/OnePlus-logo.jpg',
            onChipTap: () {},
          ),
          Chipadd(
            label: 'Huwei',
            image: 'assets/images/Huawei-logo.jpg',
            onChipTap: () {},
          ),
          Chipadd(
            label: 'Samsung',
            image: 'assets/images/Samsung-logo.jpg',
            onChipTap: () {},
          ),
          Chipadd(
            label: 'Poco',
            image: 'assets/images/Screenshot 2023-08-07 010809.png',
            onChipTap: () {},
          ),
          Chipadd(
            label: 'Oppo',
            image: 'assets/images/OPPO-logo.jpg',
            onChipTap: () {},
          ),
          Chipadd(
            label: 'Vivo',
            image: 'assets/images/Vivo-logo.jpg',
            onChipTap: () {},
          ),
          Chipadd(
            label: 'Lenovo',
            image: 'assets/images/Lenovo-logo.jpg',
            onChipTap: () {},
          ),
          Chipadd(
            label: 'Nokia',
            image: 'assets/images/Nokia-Logo.png',
            onChipTap: () {},
          ),
        ],
      ),
    );
  }
}
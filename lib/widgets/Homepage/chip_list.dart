import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/chip.dart'; // Import other necessary dependencies

class ItemsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(12),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Chipadd(
            borderColor: Colors.red,
            label: 'Apple',
            image: 'assets/images/Apple-Logo.png',
          ),
          Chipadd(
            label: 'Xiomi',
            image: 'assets/images/Xiaomi-logo.jpg',
          ),
          Chipadd(
            label: 'Oneplus',
            image: 'assets/images/OnePlus-logo.jpg',
          ),
          Chipadd(
            label: 'Huwei',
            image: 'assets/images/Huawei-logo.jpg',
          ),
          Chipadd(
            label: 'Samsung',
            image: 'assets/images/Samsung-logo.jpg',
          ),
          Chipadd(
              label: 'Poco',
              image: 'assets/images/Screenshot 2023-08-07 010809.png'),
          Chipadd(
            label: 'Oppo',
            image: 'assets/images/OPPO-logo.jpg',
          ),
          Chipadd(
            label: 'Vivo',
            image: 'assets/images/Vivo-logo.jpg',
          ),
          Chipadd(
            label: 'Lenovo',
            image: 'assets/images/Lenovo-logo.jpg',
          ),
          Chipadd(
            label: 'Nokia',
            image: 'assets/images/Nokia-Logo.png',
          ),
        ],
      ),
    );
  }
}

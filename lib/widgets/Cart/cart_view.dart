import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/widgets/cart/button.dart';
import 'package:giltezy_2ndproject/widgets/cart/cart_items.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   foregroundColor: Colors.black,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios_new_outlined),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: const Text(
      //     'My Cart',
      //     style: kvrheading,
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CartItemsviews(
                descriptions: 'Iphone x-mas',
                imagePath: 'assets/images/walling-52H5Nfi5WiE-unsplash.jpg',
                price: '₹23000'),
            SizedBox(
              height: 10,
            ),
            CartItemsviews(
                descriptions: 'Samsung A -13',
                imagePath:
                    'assets/images/ramal-wickramasinghe-OjMyiwfviQ4-unsplash.jpg',
                price: '₹12000'),
            SizedBox(
              height: 10,
            ),
            CartItemsviews(
                descriptions: 'OnePlus Nord 2',
                imagePath: 'assets/images/anh-nhat-yqcloMb3Abw-unsplash.jpg',
                price: '₹42000'),
            SizedBox(
              height: 10,
            ),
            CartItemsviews(
                descriptions: 'Realme XMS',
                imagePath:
                    'assets/images/thai-nguyen-dcSJWwdyAl8-unsplash (1).jpg',
                price: ' ₹45200'),
            SizedBox(
              height: 10,
            ),
            CartItemsviews(
                descriptions: 'Samsung max',
                imagePath:
                    'assets/images/max-whitehead-nRKzAy4w6mE-unsplash.jpg',
                price: ' ₹24500'),
            BuyButton()
          ],
        ),
      ),
    );
  }
}

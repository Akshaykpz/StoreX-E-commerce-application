import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/widgets/Accounts/order/order_status.dart';
import 'package:pushable_button/pushable_button.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: PushableButton(
        height: 40, // Adjust the height here
        elevation: 8,
        hslColor: const HSLColor.fromAHSL(1.0, 180, 1.0, 0.37),
        shadow: BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 1),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyOrder(),
              ));
        },
        child: const Text('BUY NOW',
            style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}

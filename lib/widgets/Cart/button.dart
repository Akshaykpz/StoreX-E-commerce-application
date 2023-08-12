import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/AllSettings/orders.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/Order/order_status.dart';
import 'package:pushable_button/pushable_button.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: PushableButton(
        child: Text('BUY NOW', style: TextStyle(fontWeight: FontWeight.w700)),
        height: 40, // Adjust the height here
        elevation: 8,
        hslColor: HSLColor.fromAHSL(1.0, 180, 1.0, 0.37),
        shadow: BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 1),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyOrder(),
              ));
        },
      ),
    );
  }
}

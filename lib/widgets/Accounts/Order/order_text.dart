import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';

class OrderText extends StatelessWidget {
  final child;
  const OrderText({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 90.0,
      width: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.teal,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Center(
          child: Text(
        child,
        style: kvwtext,
      )),
    );
  }
}

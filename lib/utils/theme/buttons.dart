import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';

class MyButtons extends StatelessWidget {
  final String buttonText;
  final Widget destinationRoute;

  MyButtons({required this.buttonText, required this.destinationRoute});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destinationRoute,
          ),
        );
      },
      child: Text(
        buttonText,
        style: kvwtext,
      ),
    );
  }
}

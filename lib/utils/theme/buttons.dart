import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:page_transition/page_transition.dart';

class MyButtons extends StatelessWidget {
  final String buttonText;
  final Widget destinationRoute;

  const MyButtons(
      {super.key, required this.buttonText, required this.destinationRoute});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: destinationRoute,
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

import 'package:flutter/material.dart';

import '../../utils/theme/textstyle.dart';

class MyButton extends StatelessWidget {
  final String buttontext;
  final VoidCallback onPressedCallback;
  final IconData icons;

  const MyButton(
      {super.key,
      required this.buttontext,
      required this.onPressedCallback,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: onPressedCallback,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 77, 180, 228),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 15.0,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icons),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Text(
              buttontext,
              style: kstext,
            ),
          ),
        ]),
      ),
    );
  }
}

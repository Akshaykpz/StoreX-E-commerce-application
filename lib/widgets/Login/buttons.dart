import 'package:flutter/material.dart';

import '../../utils/theme/textstyle.dart';

class MyButton extends StatelessWidget {
  final String buttontext;
  final VoidCallback onPressedCallback;

  MyButton(
      {super.key, required this.buttontext, required this.onPressedCallback});

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
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            buttontext,
            style: kstext,
          ),
        ),
      ),
    );
  }
}

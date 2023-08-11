import 'package:flutter/material.dart';

class MyNewButton extends StatelessWidget {
  final String buttontext;
  final VoidCallback onPressedCallback;

  MyNewButton({
    super.key,
    required this.buttontext,
    required this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            side: BorderSide(width: 3, color: Colors.white),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // padding: EdgeInsets.all(20),
          ),
          onPressed: onPressedCallback,
          child: Text(
            buttontext,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              // Set the text color here
              color: Colors.teal, // Change this to your desired text color
            ),
          ),
        ),
      ),
    );
  }
}

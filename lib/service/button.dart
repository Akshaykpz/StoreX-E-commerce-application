import 'package:flutter/material.dart';

class MyNewButton extends StatelessWidget {
  final String buttontext;
  final VoidCallback onPressedCallback;
  final IconData? icons;

  const MyNewButton({
    super.key,
    this.icons,
    required this.buttontext,
    required this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(width: 0.9, color: Colors.black),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // padding: EdgeInsets.all(20),
          ),
          onPressed: onPressedCallback,
          child: Row(
            children: [
              Icon(
                icons,
                color: Colors.black54,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                buttontext,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  // Set the text color here
                  color: Colors.black, // Change this to your desired text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

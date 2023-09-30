import 'package:flutter/material.dart';

class Squretile extends StatelessWidget {
  final String imagepath;
  final VoidCallback onpress;
  const Squretile({super.key, required this.imagepath, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1)
            ]),
        child: Image.asset(
          imagepath,
          height: 40,
        ),
      ),
    );
  }
}

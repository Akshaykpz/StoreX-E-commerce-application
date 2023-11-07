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
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(5),

            // color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.transparent,
                  offset: Offset(1, 2),
                  spreadRadius: 3)
            ]),
        child: Image.asset(
          imagepath,
          height: 40,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CatButton extends StatelessWidget {
  final VoidCallback ontaps;

  const CatButton({super.key, required this.ontaps});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontaps,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(42)),
          boxShadow: [
            BoxShadow(
              color: Colors.deepOrange.shade400,
              offset: const Offset(0, 20),
              blurRadius: 30,
              spreadRadius: -5,
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepOrange.shade400,
                Colors.deepOrange.shade400,
                Colors.deepOrange.shade400,
                Colors.deepOrange.shade400,
              ],
              stops: const [
                0.1,
                0.3,
                0.9,
                1.0
              ]),
        ),
        child: const Center(child: Text("Add Category")),
      ),
    );
  }
}

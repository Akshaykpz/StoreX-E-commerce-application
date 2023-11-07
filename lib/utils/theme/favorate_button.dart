import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavorateButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final ontap;
  bool isButtonTap;
  FavorateButton({super.key, required this.ontap, required this.isButtonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: isButtonTap ? Colors.white : Colors.white30,
              offset: isButtonTap ? const Offset(6, 6) : const Offset(-6, -6),
              spreadRadius: 1,
            ),
          ],
          color: Colors.white24,
        ),
        child: Icon(
          Icons.favorite,
          color: isButtonTap ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}

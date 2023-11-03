import 'package:flutter/material.dart';

class AdminText extends StatelessWidget {
  final String text;
  const AdminText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}

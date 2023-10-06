import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;

  const CustomSnackBar({super.key, required this.message});

  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This widget doesn't need a build method.
    return const SizedBox.shrink();
  }
}

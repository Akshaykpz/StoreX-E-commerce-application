import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;

  CustomSnackBar({required this.message});

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
    return SizedBox.shrink();
  }
}

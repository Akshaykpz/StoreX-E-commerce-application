import 'package:flutter/material.dart';

class CustomSnackBarWidget {
  void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.green,
    double elevation = 10,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry margin = const EdgeInsets.all(5),
  }) {
    final snackDemo = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      elevation: elevation,
      behavior: behavior,
      margin: margin,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackDemo);
  }
}

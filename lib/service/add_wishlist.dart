import 'package:flutter/material.dart';

void showMultiActionSnackbar(BuildContext context) {
  const snackBar = SnackBar(
    content: Text('This is a multi-action Snackbar.'),
    duration: Duration(seconds: 1),
  );

  // Show the Snackbar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

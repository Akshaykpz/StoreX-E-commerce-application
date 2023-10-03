import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void showMultiActionSnackbar(BuildContext context) {
  const snackBar = SnackBar(
    content: Text('This is a multi-action Snackbar.'),
    duration: Duration(seconds: 1),
  );

  // Show the Snackbar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

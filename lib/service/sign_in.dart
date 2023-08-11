import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> _handleSignOut(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    // If the sign-out is successful, navigate back to the login page
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(
        context, '/login'); // Replace '/login' with your login page route
  } catch (e) {
    log('Error occurred while signing out: $e');
  }
}

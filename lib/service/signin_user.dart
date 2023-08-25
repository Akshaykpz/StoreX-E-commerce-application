import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/theme/theme.dart';
import '../widgets/Homepage/home.dart';

Future<void> handleSignUp({
  required BuildContext context,
  required String email,
  required String password,
  required String confirmPassword,
}) async {
  // String email = _emailSigninController.text;
  // String password = _passwordSigninController.text;

  if (password != confirmPassword) {
    // Passwords do not match, handle the error (e.g., show an error message)
    // For simplicity, let's just log the error here:
    log("Passwords do not match.");
    return;
  }

  try {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppUtils.gkwhite,
          ));
        });
    // Perform the sign-up with email and password
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ),
          ),
        );

    // Sign-up successful, navigate to the home page or a verification page
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      log('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      log('The account already exists for that email.');
    } else {
      log('Error occurred: ${e.message}');
    }
  } catch (e) {
    log('Unknown error occurred: $e');
  }
}

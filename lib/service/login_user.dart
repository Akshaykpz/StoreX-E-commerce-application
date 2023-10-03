import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/theme.dart';
import 'dart:developer';

import 'package:giltezy_2ndproject/widgets/homepage/home.dart';

bool isLoggedIn = false;
// bool isAdmin = false;

Future<void> handleLogin({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  try {
    if (email.isEmpty) {
      log('Email is empty.');
      return; // Exit early if email is empty
    }

    if (password.isEmpty) {
      log('Password is empty.');
      return; // Exit early if password is empty
    }

    if (!isValidEmail(email)) {
      log('Invalid email format.');
      return; // Exit early if email format is invalid
    }

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppUtils.gkwhite,
          ),
        );
      },
    );

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyItemviewpage(),
        ),
      );
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      log('No user record found for that email.');
    } else if (e.code == 'wrong-password') {
      log('Wrong password provided for that user.');
    } else {
      log('Error occurred: ${e.message}');
    }
  } catch (e) {
    log('Unknown error occurred: $e');
  }
}

bool isValidEmail(String email) {
  // Use a regular expression to check for a valid email format
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailRegex.hasMatch(email);
}

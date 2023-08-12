import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/theme.dart';

import '../widgets/Homepage/home.dart';

Future<void> handleLogin(
    {required BuildContext context,
    required String email,
    required String password}) async {
  try {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
            color: AppUtils.gkwhite,
          ));
        });

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            ));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      log('No user record found for that email.');
    } else if (e.code == 'wrong-password') {
      log('Wrong password provided for that user.');
    } else {
      log('Error occurred: ${e.message}');
    }
  } catch (e) {
    log('Unknownerror occurred: $e');
  }
}

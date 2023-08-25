import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/Homepage/home.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<void> handleGoogleSignIn(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // User canceled the sign-in
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Sign in to Firebase with Google credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Authenticate with Firebase
    await FirebaseAuth.instance.signInWithCredential(credential);

    // Navigate to the home page after successful sign-in
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  } catch (e) {
    // Handle sign-in error
    log('Error signing in with Google: $e');
  }
}

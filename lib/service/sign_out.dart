import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Login/login_page.dart';

import '../utils/theme/theme.dart';

Future<void> showSignOutDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sign Out'),
        content: Text('Are you sure you want to sign out?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              _handleSignOut(context); // Call the sign-out function
            },
            child: Text('Sign Out'),
          ),
        ],
      );
    },
  );
}

Future<void> _handleSignOut(BuildContext context) async {
  try {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set background color
          contentTextStyle: TextStyle(color: Colors.black), // Set text color
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: Colors.black, // Set indicator color
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('Reset'),
              ),
            ],
          ),
        );
      },
    );

    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyLogin()),
        (route) => false,
      );
    });
  } catch (e) {
    log('Error occurred while signing out: $e');
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/login/login_page.dart';

Future<void> _handleSignOut(BuildContext context) async {
  try {
    Navigator.of(context).pop(); // Close the CoolAlert

    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MyLogin()),
        (route) => false,
      );
    });
  } catch (e) {
    log('Error occurred while signing out: $e');
  }
}

Future<void> showSignOutDialog(BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text('Logout'),
              content: const Text("Are you sure you want to Logout?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No")),
                TextButton(
                    onPressed: () async {
                      await _handleSignOut(context);
                    },
                    child: const Text("Yes"))
              ]),
        );
      });
  // CoolAlert.show(
  //   context: context,
  //   type: CoolAlertType.confirm, // Use confirm type for confirmation dialog
  //   title: 'Sign Out',
  //   confirmBtnText: 'Sign Out',
  //   cancelBtnText: 'Cancel',
  //   confirmBtnColor: Colors.red, // Customize the confirm button color
  //   onConfirmBtnTap: () async {
  //     // Navigator.of(context).pop(); // Close the CoolAlert
  //     await _handleSignOut(context); // Call the sign-out function
  //   },
  // );
}

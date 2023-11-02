import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/login/login_page.dart';
import 'package:page_transition/page_transition.dart';

Future<void> _handleSignOut(BuildContext context) async {
  try {
    Navigator.of(context).pop(); // Close the CoolAlert

    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(type: PageTransitionType.fade, child: const MyLogin()),
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
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Logout'),
            content: const Text("Are you sure you want to Logout?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () async {
                    await _handleSignOut(context);
                  },
                  child: const Text("Yes"))
            ]);
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

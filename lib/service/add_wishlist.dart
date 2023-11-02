import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ShowSnackbar {
  void showMultiActionSnackbar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('This is a multi-action Snackbar.'),
      duration: Duration(seconds: 1),
    );

    // Show the Snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showLoadingSnackbar(BuildContext context, String text) {
    EasyLoading.show(
      status: 'loading...',
      dismissOnTap: false,
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(text),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 1),
          ),
        )
        .closed
        .then((reason) {
      EasyLoading.dismiss();
    });
  }

  void showsnackbar(BuildContext context, String text) {
    EasyLoading.show(
      status: 'loading...',
      dismissOnTap: false,
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(text),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 1),
          ),
        )
        .closed
        .then((reason) {
      EasyLoading.dismiss();
    });
  }
}

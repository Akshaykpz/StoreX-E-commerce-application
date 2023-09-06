import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImagePickerButton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  bool? isloading = false;
  bool? isloggingin = false;
  ImagePickerButton(
      {super.key,
      required this.title,
      this.isloading,
      this.isloggingin,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 60,
        width: 130,
        color: Colors.amber,
        child: Center(child: Text(title)),
      ),
    );
  }
}

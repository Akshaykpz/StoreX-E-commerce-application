import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImagePickerButton extends StatelessWidget {
  final String title;
  final IconData iconss;
  final VoidCallback onpress;
  bool? isloading = false;
  bool? isloggingin = false;
  ImagePickerButton(
      {super.key,
      required this.iconss,
      required this.title,
      this.isloading,
      this.isloggingin,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Colors.white10,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(4, 4)),
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(-4, -4))
            ]),
        height: 50,
        width: 130,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          Icon(iconss)
        ]),
      ),
    );
  }
}

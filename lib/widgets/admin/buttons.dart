import 'package:flutter/material.dart';

class AdminButtons extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressedCallback;

  const AdminButtons(
      {super.key,
      required this.text,
      this.icon,
      required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          onPressedCallback();
        },
        child: Center(
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(17),
            width: 370,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 8,
                  blurRadius: 10,
                  offset: const Offset(10, 10), // changes position of shadow
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.7),
                  spreadRadius: 8,
                  blurRadius: 10,
                  offset: const Offset(-10, -10), // changes position of shadow
                ),
              ],
            ),
            child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ]),
          ),
        ),
      ),
    );
  }
}

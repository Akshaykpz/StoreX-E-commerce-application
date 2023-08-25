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
        child: Container(
          child: Center(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(17),
              width: 370,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
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
                    offset: Offset(-10, -10), // changes position of shadow
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
                    Text(text),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ]),
            ),
          ),
          // height: 130,
          // width: 200,
          // child: Card(
          //   elevation: 3,
          //   color: Colors.white38,
        ),
      ),
    );
  }
}

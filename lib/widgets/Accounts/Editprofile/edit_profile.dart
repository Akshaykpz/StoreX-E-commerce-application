import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  final String text;
  final Icon? icons;
  final TextEditingController? controller;
  const EditProfile(
      {super.key, required this.text, this.icons, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.grey)),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: icons,
                border: InputBorder.none,
                labelText: text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  final String text;
  final Icon? icons;
  const EditProfile({super.key, required this.text, this.icons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey)),
            child: TextField(
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

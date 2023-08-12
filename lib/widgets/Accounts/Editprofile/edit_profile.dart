import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  final String text;
  const EditProfile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.red)),
            child: TextField(
              decoration: InputDecoration(
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

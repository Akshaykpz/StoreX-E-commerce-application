import 'package:flutter/material.dart';

class Serach extends StatelessWidget {
  const Serach({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextField(
          autofocus: true,
          // ...
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            fillColor: Colors.grey[320],
            filled: true,

            hintText: ' Search  ...',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.zero,

            //                border: InputBorder.none,
            //                hintText: "My Custom Search Label", // KEY PROP
            hintStyle: TextStyle(color: Colors.black), // KEY PROP
          )),
    );
  }
}

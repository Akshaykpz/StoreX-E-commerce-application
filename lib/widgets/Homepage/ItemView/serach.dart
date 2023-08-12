import 'package:flutter/material.dart';

class Serach extends StatelessWidget {
  const Serach({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: 50,

//            color: Colors.red,
        child: TextField(
            autofocus: true,
            // ...
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.arrow_back, color: Colors.grey),
              hintText: 'Search something ...',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              contentPadding: EdgeInsets.zero,

//                border: InputBorder.none,
//                hintText: "My Custom Search Label", // KEY PROP
              hintStyle: TextStyle(color: Colors.red), // KEY PROP
            )));
  }
}

import 'package:flutter/material.dart';

class Serach extends StatefulWidget {
  const Serach({super.key});

  @override
  State<Serach> createState() => _SerachState();
}

class _SerachState extends State<Serach> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextField(
        autofocus: false,
        // ...
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.clear_rounded),
          prefixIcon: const Icon(Icons.search),
          fillColor: Colors.grey[280],
          filled: true,

          hintText: ' Search  ...',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.zero,

          //                border: InputBorder.none,
          //                hintText: "My Custom Search Label", // KEY PROP
          hintStyle: const TextStyle(color: Colors.black), // KEY PROP
        ),
        onChanged: (value) {},
      ),
    );
  }
}

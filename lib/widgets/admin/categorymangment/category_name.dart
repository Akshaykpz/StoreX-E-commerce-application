import 'package:flutter/material.dart';

class Categoryname extends StatelessWidget {
  final String name;
  final double? width;
  const Categoryname({super.key, required this.name, this.width});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.green, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Categoryname extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  const Categoryname({super.key, required this.name, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 1)],
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w700, color: Colors.green, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

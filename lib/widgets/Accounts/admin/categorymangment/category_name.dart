import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categoryname extends StatelessWidget {
  final String name;
  const Categoryname({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 90,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.almarai(
              fontWeight: FontWeight.w700, color: Colors.green, fontSize: 16),
        ),
      ),
    );
  }
}

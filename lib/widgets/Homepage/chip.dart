import 'package:flutter/material.dart';

class Chipadd extends StatefulWidget {
  final String text;
  final String image;
  const Chipadd({super.key, required this.text, required this.image});

  @override
  State<Chipadd> createState() => _ChipaddState();
}

class _ChipaddState extends State<Chipadd> {
  final bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ChoiceChip(
          pressElevation: 3,
          shadowColor: Colors.grey[500],
          elevation: 5,
          backgroundColor: Colors.white,
          label: Text(widget.text),
          avatar: Image.asset(
            widget.image,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          selected: _isSelected,
          onSelected: (value) {
            setState(() {});
          },
          selectedColor: Colors.blue,
        ));
  }
}

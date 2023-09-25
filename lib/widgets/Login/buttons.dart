import 'package:flutter/material.dart';

import '../../utils/theme/textstyle.dart';

class MyButton extends StatefulWidget {
  final String buttontext;
  final VoidCallback? onPressedCallback;
  final IconData icons;

  const MyButton({
    super.key,
    required this.buttontext,
    required this.icons,
    required this.onPressedCallback,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

bool _isLoading = false;

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(250, 50),
        backgroundColor: const Color.fromARGB(255, 77, 180, 228),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: widget.onPressedCallback,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(widget.icons),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Text(
            widget.buttontext,
            style: kstext,
          ),
        ),
      ]),
    );
  }
}

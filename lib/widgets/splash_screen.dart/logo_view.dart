import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromRGBO(255, 193, 7, 1),
      // height: 50,
      // width: 90,
      child: Image.asset(
        'assets/images/Screenshot_2023-10-21_131014-removebg-preview.png',
        height: 150,
        width: 250,
      ),
    );
  }
}

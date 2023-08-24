import 'package:flutter/material.dart';

class SignUpImage extends StatelessWidget {
  final Widget child;
  const SignUpImage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.colorBurn),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
                fit: BoxFit.fill)),
        child: child,
      ),
    );
  }
}

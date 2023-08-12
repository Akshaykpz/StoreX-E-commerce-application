import 'package:flutter/material.dart';

class Backgroundimage extends StatelessWidget {
  final Widget child;
  const Backgroundimage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.colorBurn),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/imagesnew.jpg'),
                colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
                fit: BoxFit.fill)),
        child: child,
      ),
    );
  }
}

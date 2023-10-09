import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      height: 20,
      width: 50,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    ));
  }
}

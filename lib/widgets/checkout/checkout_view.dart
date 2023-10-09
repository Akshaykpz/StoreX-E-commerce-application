import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/checkout/address_view.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [AddressView()]),
    );
  }
}

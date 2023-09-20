import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductPriceFiled extends StatelessWidget {
  TextEditingController pricecontroller;
  final String label;
  ProductPriceFiled(
      {super.key, required this.pricecontroller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        controller: pricecontroller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderSide: BorderSide()),
          suffixIcon: Icon(
            Icons.error,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'please enter product price';
          }
        },
      ),
    );
  }
}

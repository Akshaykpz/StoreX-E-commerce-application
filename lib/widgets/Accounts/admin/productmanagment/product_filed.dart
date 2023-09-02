import 'package:flutter/material.dart';

class ProductFiled extends StatelessWidget {
  const ProductFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Label text',
          border: OutlineInputBorder(borderSide: BorderSide()),
          suffixIcon: Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}

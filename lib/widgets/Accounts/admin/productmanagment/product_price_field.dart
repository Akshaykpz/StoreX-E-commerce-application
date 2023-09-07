import 'package:flutter/material.dart';

class ProductPriceFiled extends StatelessWidget {
  TextEditingController pricecontroller;
  ProductPriceFiled({super.key, required this.pricecontroller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        controller: pricecontroller,
        decoration: const InputDecoration(
          labelText: 'Product name',
          border: OutlineInputBorder(borderSide: BorderSide()),
          suffixIcon: Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}

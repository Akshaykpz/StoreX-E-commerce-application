import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductFiled extends StatelessWidget {
  TextEditingController namecontroller;
  ProductFiled({super.key, required this.namecontroller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        controller: namecontroller,
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

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductFiled extends StatelessWidget {
  TextEditingController namecontroller;
  final String label;
  ProductFiled({super.key, required this.namecontroller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        controller: namecontroller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(borderSide: BorderSide()),
          suffixIcon: const Icon(
            Icons.error,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty || value == null) {
            return 'please enter product name';
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Productdescription extends StatelessWidget {
  TextEditingController description;
  final String label;
  Productdescription(
      {super.key, required this.description, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        maxLines: 7,
        minLines: 5,
        controller: description,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(borderSide: BorderSide()),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'please enter description';
          }
          return null;
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyTextformFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? hinttext;
  final bool? obcuretext;
  final Icon? icons;
  final IconButton? icon;
  final Function(String?)? onSubmitted;
  final String? Function(String?)? validator; // Add this validator function

  const MyTextformFiled({
    Key? key,
    this.controller,
    this.hinttext,
    this.obcuretext,
    this.icons,
    this.icon,
    this.onSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        obscureText: obcuretext ?? false,

        decoration: InputDecoration(
          suffixIcon: icon,
          prefixIcon: icons,
          prefixIconColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          hintText: hinttext,
          fillColor: Colors.white30.withOpacity(0.2),
          hintStyle: const TextStyle(color: Colors.white),
          errorStyle: const TextStyle(
            color: Colors.redAccent, // Change the text color to red
            fontSize: 14.0,
          ),
        ),
        validator: validator, // Use the validator function
        onFieldSubmitted: onSubmitted,
      ),
    );
  }
}

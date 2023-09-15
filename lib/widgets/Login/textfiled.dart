import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/theme.dart';

class MyTextformFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? hinttext;
  final bool? obcuretext;
  final Icon? icons;
  final Function(String?)? onSubmitted;
  final String? Function(String?)? validator; // Add this validator function

  MyTextformFiled({
    Key? key,
    this.controller,
    this.hinttext,
    this.obcuretext,
    this.icons,
    this.onSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 29),
      child: TextFormField(
        controller: controller,
        obscureText: obcuretext ?? false,
        decoration: InputDecoration(
          prefixIcon: icons,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          hintText: hinttext,
          fillColor: AppUtils.gkwhite,
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

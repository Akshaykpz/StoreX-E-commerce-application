import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/theme.dart';

class MyTextformFiled extends StatelessWidget {
  final controller;
  final String? hinttext;
  final bool? obcuretext;
  final Icon? icons;
  const MyTextformFiled(
      {super.key, this.controller, this.hinttext, this.obcuretext, this.icons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 19, horizontal: 29),
      child: TextField(
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(
            prefixIcon: icons,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)),
            filled: true,
            hintText: hinttext,
            fillColor: AppUtils.gkwhite),
      ),
    );
  }
}

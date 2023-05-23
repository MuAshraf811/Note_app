// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.prefixIcon,
      required this.hint,
      required this.validator,
      required this.controller,
      required this.maxLines});
  IconData prefixIcon;
  String hint;
  int maxLines;
  TextEditingController controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: const BorderSide(
                color: Colors.teal,
              )),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          )),
    );
  }
}

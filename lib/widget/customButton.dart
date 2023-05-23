// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onpressed});
  IconData icon;
  String text;
  void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onpressed,
      icon: Icon(icon),
      label: Text(text),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.teal),
      ),
    );
  }
}

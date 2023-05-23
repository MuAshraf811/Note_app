// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/Theme/hive_theme_helper.dart';

class SwitchThemeController extends StatefulWidget {
  const SwitchThemeController({super.key});

  @override
  State<SwitchThemeController> createState() => _SwitchThemeControllerState();
}

class _SwitchThemeControllerState extends State<SwitchThemeController> {
  @override
  void initState() {
    HiveThemeController.box;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('App Theme'),
      activeColor: Colors.deepOrange,
      value: HiveThemeController.box.get('mode'),
      onChanged: (value) {
        setState(() {
          HiveThemeController.currentTheme(value);
          print(HiveThemeController.box.get('mode'));
        });
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveThemeController {
  static final box = Hive.box('theme');
  static void currentTheme(bool isDark) {
    final val = Hive.box('theme');
    val.put('mode', isDark);
  }

  static  theme (bool isDark) {
    if (isDark) {
      ThemeData.dark();
    } else {
      return ThemeData.light();
    }
  }
}

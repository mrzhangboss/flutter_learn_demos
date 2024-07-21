import 'package:flutter/material.dart';

import 'dart_mode.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = lightTheme;

  bool get isDarkMode => themeData == darkTheme;

  void toggleTheme(bool isOn) {
    themeData = isOn ? darkTheme : lightTheme;
    notifyListeners();
  }
}

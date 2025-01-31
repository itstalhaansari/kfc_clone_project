import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;

  ThemeMode getThemeMode() {
    return _currentTheme;
  }

  void Toggle() {
    if (_currentTheme == ThemeMode.light) {
      _currentTheme = ThemeMode.dark;
    } else {
      _currentTheme = ThemeMode.light;
    }
    notifyListeners();
  }
}

import 'package:calculator_app/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isSelected = false;
  bool get isSelected => _isSelected;
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    _isSelected =! _isSelected;
    notifyListeners();
  }
}

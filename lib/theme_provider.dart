import 'package:calculator_app/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isSelected = true;
  bool get isSelected => _isSelected;
  ThemeData _themeData = darkMode;
  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (_themeData == darkMode) {
      _themeData = lightMode;
    } else {
      _themeData = darkMode;
    }
    _isSelected =! _isSelected;
    notifyListeners();
  }
}

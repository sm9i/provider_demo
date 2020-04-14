import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    _currentTheme = ThemeData.light();
  }

  ThemeData _currentTheme;
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeData get currentTheme => _currentTheme;

  void changeTheme(bool dark) {
    if (isDark == dark) return;
    this._currentTheme = dark ? ThemeData.dark() : ThemeData.light();
    this._isDark = dark;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

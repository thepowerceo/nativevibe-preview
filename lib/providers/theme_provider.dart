import 'package:flutter/material.dart';

/// Manages the application's theme settings (light/dark mode).
class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  /// Returns the current theme mode.
  ThemeMode get themeMode => _themeMode;

  /// Returns true if the current theme mode is dark.
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  /// Toggles between light and dark theme modes.
  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
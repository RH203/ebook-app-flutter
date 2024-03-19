import 'package:flutter/material.dart';
import 'package:novel_app/src/shared_preferences/theme_preferences.dart';

class ProviderTheme extends ChangeNotifier {
  ThemePreferences themePreferences = ThemePreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  bool setDarkTheme() {
    return _darkTheme;
  }

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    themePreferences.setDarkTheme(_darkTheme);
    notifyListeners();
  }

  
}

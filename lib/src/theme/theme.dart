import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        primary: isDarkTheme
            ? const Color.fromARGB(255, 122, 122, 122)
            : Colors.grey.shade500,
        onPrimary:
            isDarkTheme ? const Color(0xFF381E72) : const Color(0xFFFFFFFF),
        primaryContainer:
            isDarkTheme ? const Color(0xFF4F378B) : const Color(0xFFEADDFF),
        onPrimaryContainer:
            isDarkTheme ? const Color(0xFFEADDFF) : const Color(0xFF21005D),
        inversePrimary:
            isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade700,
        secondary: isDarkTheme
            ? const Color.fromRGBO(255, 30, 30, 30)
            : Colors.grey.shade100,
        onSecondary:
            isDarkTheme ? const Color(0xFF332D41) : const Color(0xFFFFFFFF),
        secondaryContainer:
            isDarkTheme ? const Color(0xFF4A4458) : const Color(0xFFE8DEF8),
        onSecondaryContainer:
            isDarkTheme ? const Color(0xFFE8DEF8) : const Color(0xFF1D192B),
        tertiary:
            isDarkTheme ? const Color.fromRGBO(255, 47, 47, 47) : Colors.white,
        onTertiary:
            isDarkTheme ? const Color(0xFF492532) : const Color(0xFFFFFFFF),
        tertiaryContainer:
            isDarkTheme ? const Color(0xFF633B48) : const Color(0xFFFFD8E4),
        onTertiaryContainer:
            isDarkTheme ? const Color(0xFFFFD8E4) : const Color(0xFF31111D),
        error: isDarkTheme ? const Color(0xFFF2B8B5) : const Color(0xFFB3261E),
        onError:
            isDarkTheme ? const Color(0xFF601410) : const Color(0xFFFFFFFF),
        errorContainer:
            isDarkTheme ? const Color(0xFF8C1D18) : const Color(0xFFF9DEDC),
        onErrorContainer:
            isDarkTheme ? const Color(0xFFF9DEDC) : const Color(0xFF410E0B),
        background: isDarkTheme ? Colors.grey.shade700 : Colors.grey.shade300,
        onBackground: isDarkTheme ? Colors.black : Colors.white,
        surface: isDarkTheme
            ? const Color(0xFF1C1B1F)
            : const Color.fromARGB(255, 121, 87, 169),
        onSurface: isDarkTheme ? const Color(0xFFE6E1E5) : Colors.black,
        surfaceVariant:
            isDarkTheme ? const Color(0xFF49454F) : const Color(0xFFE7E0EC),
        onSurfaceVariant:
            isDarkTheme ? const Color(0xFFCAC4D0) : const Color(0xFFE6E1E5),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

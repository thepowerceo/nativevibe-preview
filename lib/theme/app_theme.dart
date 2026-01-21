import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF00D9FF); // Custom primary color

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: Colors.tealAccent.shade700,
      surface: Colors.white,
      onSurface: Colors.black87,
      onSurfaceVariant: Colors.black54,
      background: Colors.grey.shade100,
      onBackground: Colors.black87,
      error: Colors.red.shade700,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.grey.shade100,
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      // Define your text styles here if needed
      headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 16.0),
      bodyMedium: TextStyle(fontSize: 14.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: Colors.tealAccent.shade400,
      surface: const Color(0xFF1E1E1E), // Darker surface for cards/sheets
      onSurface: Colors.white70,
      onSurfaceVariant: Colors.white38,
      background: const Color(0xFF121212), // Very dark background
      onBackground: Colors.white70,
      error: Colors.red.shade300,
      onError: Colors.black,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardTheme: CardTheme(
      color: const Color(0xFF1E1E1E),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0xFF1E1E1E),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white70),
      headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white70),
      titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white70),
      titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white70),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white70),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white60),
    ),
     elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  );
}
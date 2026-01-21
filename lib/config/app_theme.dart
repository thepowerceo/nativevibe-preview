import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Defines the color scheme and themes for the application.
class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  /// The primary color for the application, used as a seed for the color scheme.
  static const Color _primaryColor = Color(0xFF00D9FF);

  /// Defines the light theme for the application using Material 3.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: ThemeData.light().scaffoldBackgroundColor,
      foregroundColor: ThemeData.light().colorScheme.onSurface,
    ),
  );

  /// Defines the dark theme for the application using Material 3.
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      foregroundColor: ThemeData.dark().colorScheme.onSurface,
    ),
  );
}
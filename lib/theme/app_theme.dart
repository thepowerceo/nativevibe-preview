import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Defines the application's color scheme and themes.
class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  /// The primary color for the application.
  static const Color _primaryColor = Color(0xFF00D9FF);

  /// The light theme configuration for the application.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      titleTextStyle: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.black,
      ),
    ),
  );

  /// The dark theme configuration for the application.
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      titleTextStyle: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
    ),
  );
}
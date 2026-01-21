import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Defines the application's theme constants.
class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  /// The primary color for the application theme.
  static const Color _primaryColor = Color(0xFF00D9FF);

  /// The light theme data.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20),
    ),
  );

  /// The dark theme data.
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20),
    ),
  );
}
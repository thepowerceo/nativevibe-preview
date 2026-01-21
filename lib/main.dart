import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coolest_app_ever/providers/theme_provider.dart';
import 'package:coolest_app_ever/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Coolest App Ever',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme.light(
                primary: const Color(0xFF00D9FF), // Primary color
                onPrimary: Colors.black,
                surface: Colors.white,
                onSurface: Colors.black,
                secondary: const Color(0xFF00BCD4), // Example secondary color
                onSecondary: Colors.black,
              ),
              useMaterial3: true,
              fontFamily: 'Roboto',
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.dark(
                primary: const Color(0xFF00B3D9), // Darker primary for dark mode
                onPrimary: Colors.white,
                surface: Colors.black,
                onSurface: Colors.white,
                secondary: const Color(0xFF00ACC1), // Example secondary color for dark mode
                onSecondary: Colors.white,
              ),
              useMaterial3: true,
              fontFamily: 'Roboto',
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
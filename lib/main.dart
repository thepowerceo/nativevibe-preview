import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vibrant_fit/services/workout_provider.dart';
import 'package:vibrant_fit/screens/home_screen.dart';

void main() {
  runApp(const VibrantFitApp());
}

class VibrantFitApp extends StatelessWidget {
  const VibrantFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF00D9FF);

    return ChangeNotifierProvider(
      create: (context) => WorkoutProvider(),
      child: MaterialApp(
        title: 'VibrantFit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: false,
            elevation: 0,
          ),
          cardTheme: CardThemeData(
             elevation: 1,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(16.0),
             ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            shape: CircleBorder(),
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            brightness: Brightness.dark,
            background: const Color(0xFF121212),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: false,
            elevation: 0,
            backgroundColor: Color(0xFF121212),
          ),
          cardTheme: CardThemeData(
            elevation: 1,
            color: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
           floatingActionButtonTheme: const FloatingActionButtonThemeData(
            shape: CircleBorder(),
          ),
        ),
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}
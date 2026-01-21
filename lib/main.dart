import 'package:fittrack/config/app_theme.dart';
import 'package:fittrack/providers/workout_provider.dart';
import 'package:fittrack/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the FitTrack application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutProvider(),
      child: MaterialApp(
        title: 'FitTrack',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system, // Respect device settings
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
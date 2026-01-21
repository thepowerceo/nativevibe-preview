import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fittrack/providers/workout_provider.dart';
import 'package:fittrack/screens/home_screen.dart';
import 'package:fittrack/utils/app_theme.dart';

void main() {
  runApp(const FitTrackApp());
}

/// The root widget of the FitTrack application.
class FitTrackApp extends StatelessWidget {
  /// Creates the FitTrackApp widget.
  const FitTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutProvider(),
      child: MaterialApp(
        title: 'FitTrack',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}
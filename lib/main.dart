import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flavor_finder/providers/recipe_provider.dart';
import 'package:flavor_finder/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ],
      child: const FlavorFinderApp(),
    ),
  );
}

class FlavorFinderApp extends StatelessWidget {
  const FlavorFinderApp({super.key});

  static const primaryCyan = Color(0xFF00D9FF);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlavorFinder',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryCyan,
          primary: primaryCyan,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryCyan,
          primary: primaryCyan,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: const HomeScreen(),
    );
  }
}
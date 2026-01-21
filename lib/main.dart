import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyline_messenger/services/chat_provider.dart';
import 'package:skyline_messenger/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ChatProvider(),
      child: const SkylineApp(),
    ),
  );
}

class SkylineApp extends StatelessWidget {
  const SkylineApp({super.key});

  static const primaryCyan = Color(0xFF00D9FF);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skyline Messenger',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryCyan,
          brightness: Brightness.light,
          primary: primaryCyan,
        ),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryCyan,
          brightness: Brightness.dark,
          primary: primaryCyan,
          surface: const Color(0xFF121212),
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: const HomeScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vimeo_streamer/providers/video_provider.dart';
import 'package:vimeo_streamer/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Force landscape mode for tablet-like education experience
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => VideoProvider(),
      child: const VimeoApp(),
    ),
  );
}

class VimeoApp extends StatelessWidget {
  const VimeoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryCyan = Color(0xFF00D9FF);

    return MaterialApp(
      title: 'Vimeo Streamer',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryCyan,
          primary: primaryCyan,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryCyan,
          primary: primaryCyan,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: const HomeScreen(),
    );
  }
}
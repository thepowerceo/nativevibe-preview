import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_app/screens/home_screen.dart';
import 'package:flutter_chat_app/services/chat_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF00D9FF);

    return ChangeNotifierProvider(
      create: (context) => ChatService(),
      child: MaterialApp(
        title: 'Flutter Chat',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark, // Default to dark theme
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            brightness: Brightness.dark,
            primary: primaryColor,
          ),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
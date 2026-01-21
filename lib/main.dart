import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat/services/chat_service.dart';
import 'package:flutter_chat/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF00D9FF);

    return ChangeNotifierProvider(
      create: (_) => ChatService(),
      child: MaterialApp(
        title: 'Flutter Chat',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            brightness: Brightness.dark,
            primary: primaryColor,
            secondary: primaryColor,
          ),
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF121212),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1E1E1E),
            elevation: 0,
            centerTitle: true,
          ),
          cardTheme: CardTheme(
            color: const Color(0xFF1E1E1E),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
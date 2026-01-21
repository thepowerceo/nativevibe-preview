import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relish_style_booking/providers/booking_provider.dart';
import 'package:relish_style_booking/screens/home_screen.dart';
import 'package:relish_style_booking/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookingProvider(),
      child: MaterialApp(
        title: 'Relish Style',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}
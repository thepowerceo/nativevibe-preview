import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coolest_app_ever/providers/theme_provider.dart';
import 'package:coolest_app_ever/widgets/custom_card.dart';

/// The home screen of the application.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coolest App Ever'),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Welcome to the Coolest App Ever!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                CustomCard(
                  title: 'Feature 1',
                  description: 'This is the first amazing feature.',
                  icon: Icons.star,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 20),
                CustomCard(
                  title: 'Feature 2',
                  description: 'Another cool functionality awaits!',
                  icon: Icons.rocket,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 20),
                CustomCard(
                  title: 'New Feature!',
                  description: 'Check out this brand new addition!',
                  icon: Icons.celebration,
                  color: Theme.of(context).colorScheme.tertiary, // Using tertiary for the new feature
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
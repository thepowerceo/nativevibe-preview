import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/hourly_forecast_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0; // For bottom navigation

  @override
  void initState() {
    super.initState();
    // Fetch weather for a default location on startup
    Provider.of<WeatherProvider>(context, listen: false).fetchWeather('London');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchLocation() {
    final location = _searchController.text;
    if (location.isNotEmpty) {
      Provider.of<WeatherProvider>(context, listen: false).fetchWeather(location);
      _searchController.clear();
      // Optionally close the keyboard
      FocusScope.of(context).unfocus();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation if needed, for now just for demo
    if (index == 1) {
      Provider.of<WeatherProvider>(context, listen: false).toggleTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: _LocationSearchDelegate(_searchController, _searchLocation),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Provider.of<WeatherProvider>(context).isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
            onPressed: () {
              Provider.of<WeatherProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          if (weatherProvider.currentWeather == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return _buildBody(weatherProvider.currentWeather!); 
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody(WeatherData weatherData) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentWeatherWidget(weatherData: weatherData),
            const SizedBox(height: 20),
            HourlyForecastWidget(hourlyForecast: weatherData.hourlyForecast),
            // Add more widgets for daily forecast, etc.
          ],
        ),
      ),
    );
  }
}

class _LocationSearchDelegate extends SearchDelegate<String> {
  final TextEditingController controller;
  final VoidCallback onSearch;

  _LocationSearchDelegate(this.controller, this.onSearch);

  @override
  String get searchFieldLabel => 'Enter city name';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          controller.clear();
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Trigger search when results are shown
    if (query.isNotEmpty) {
      controller.text = query;
      onSearch();
    }
    return Container(); // No specific UI for results here, handled by onSearch
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can implement location suggestions here if you have an API for it.
    // For now, we'll just use the text field.
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter city name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onSubmitted: (value) {
          query = value;
          controller.text = value;
          onSearch();
          close(context, value); // Close search after submitting
        },
      ),
    );
  }
}
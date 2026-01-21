import 'package:flutter/foundation.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart'; // Assuming you have a WeatherService

class WeatherProvider with ChangeNotifier {
  WeatherData? _currentWeather;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isDarkMode = false;

  WeatherData? get currentWeather => _currentWeather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isDarkMode => _isDarkMode;

  final WeatherService _weatherService = WeatherService(); // Instantiate your service

  /// Fetches weather data for a given location.
  Future<void> fetchWeather(String location) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _currentWeather = await _weatherService.getWeather(location);
    } catch (e) {
      _errorMessage = 'Failed to load weather data. Please try again.';
      _currentWeather = null; // Clear previous data on error
      if (kDebugMode) {
        print('Error fetching weather: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Toggles the application theme between light and dark mode.
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
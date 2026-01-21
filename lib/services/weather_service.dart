import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class WeatherService {
  // Replace with your actual API key
  final String _apiKey = 'YOUR_OPENWEATHERMAP_API_KEY'; 
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String _forecastUrl = 'https://api.openweathermap.org/data/2.5/forecast'; // For hourly forecast

  /// Fetches current weather data for a given location.
  Future<WeatherData> getWeather(String location) async {
    try {
      final currentResponse = await http.get(Uri.parse(
          '$_baseUrl?q=$location&appid=$_apiKey&units=metric')); // Use metric for Celsius

      if (currentResponse.statusCode == 200) {
        final currentData = json.decode(currentResponse.body);
        
        // Fetch hourly forecast data
        final forecastResponse = await http.get(Uri.parse(
            '$_forecastUrl?q=$location&appid=$_apiKey&units=metric'));

        if (forecastResponse.statusCode == 200) {
          final forecastData = json.decode(forecastResponse.body);
          currentData['list'] = forecastData['list']; // Merge forecast data into current data for easier parsing
          return WeatherData.fromJson(currentData);
        } else {
          throw Exception('Failed to load hourly forecast');
        }
      } else {
        throw Exception('Failed to load weather data: ${currentResponse.statusCode}');
      }
    } catch (e) {
      rethrow; // Rethrow the exception to be caught by the provider
    }
  }
}
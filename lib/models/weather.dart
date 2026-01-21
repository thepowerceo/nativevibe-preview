class WeatherData {
  final String location;
  final double temperature;
  final String condition;
  final String iconUrl;
  final List<HourlyForecast> hourlyForecast;

  WeatherData({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.iconUrl,
    required this.hourlyForecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    // This is a placeholder. Replace with actual parsing logic based on your weather API response.
    // Example: OpenWeatherMap API structure
    final mainData = json['main'];
    final weatherInfo = json['weather'][0];
    final list = json['list'] as List<dynamic>?;

    return WeatherData(
      location: json['name'] ?? 'Unknown Location',
      temperature: (mainData['temp'] as num?)?.toDouble() ?? 0.0,
      condition: weatherInfo['main'] ?? 'Clear',
      iconUrl: 'https://openweathermap.org/img/wn/${weatherInfo['icon']}@2x.png',
      hourlyForecast: list != null
          ? list.take(5).map((item) => HourlyForecast.fromJson(item)).toList()
          : [],
    );
  }
}

class HourlyForecast {
  final int timestamp;
  final double temperature;
  final String iconUrl;

  HourlyForecast({
    required this.timestamp,
    required this.temperature,
    required this.iconUrl,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    // Placeholder for hourly forecast parsing
    final mainData = json['main'];
    final weatherInfo = json['weather'][0];
    return HourlyForecast(
      timestamp: json['dt'] ?? DateTime.now().millisecondsSinceEpoch ~/ 1000,
      temperature: (mainData['temp'] as num?)?.toDouble() ?? 0.0,
      iconUrl: 'https://openweathermap.org/img/wn/${weatherInfo['icon']}@2x.png',
    );
  }
}
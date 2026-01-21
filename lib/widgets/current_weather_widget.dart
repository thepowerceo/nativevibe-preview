import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:intl/intl.dart'; // For date formatting

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherData weatherData;

  const CurrentWeatherWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formattedTime = DateFormat('HH:mm').format(DateTime.now());

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weatherData.location,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              formattedTime,
              style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            Image.network(
              weatherData.iconUrl,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 16),
            Text(
              '${weatherData.temperature.toStringAsFixed(1)}°C',
              style: theme.textTheme.displayLarge?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              weatherData.condition,
              style: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
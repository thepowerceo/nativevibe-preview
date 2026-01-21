import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:intl/intl.dart';

class HourlyForecastWidget extends StatelessWidget {
  final List<HourlyForecast> hourlyForecast;

  const HourlyForecastWidget({super.key, required this.hourlyForecast});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (hourlyForecast.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hourly Forecast',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120, // Fixed height for the horizontal scrollable list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyForecast.length,
            itemBuilder: (context, index) {
              final forecast = hourlyForecast[index];
              final time = DateTime.fromMillisecondsSinceEpoch(forecast.timestamp * 1000);
              final formattedTime = DateFormat('HH:mm').format(time);

              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                margin: const EdgeInsets.only(right: 10.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formattedTime,
                        style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 8),
                      Image.network(
                        forecast.iconUrl,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${forecast.temperature.toStringAsFixed(1)}°C',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
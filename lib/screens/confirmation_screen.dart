import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relish_style_booking/models/booking.dart';

class ConfirmationScreen extends StatelessWidget {
  final Booking booking;

  const ConfirmationScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmed!'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: colorScheme.primary,
                size: 80,
              ),
              const SizedBox(height: 20),
              Text(
                'All Set!',
                style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Your appointment is confirmed.',
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 0,
                color: colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildDetailRow(context, Icons.cut, 'Service:', booking.service.name),
                      const Divider(height: 20),
                      _buildDetailRow(
                        context,
                        Icons.calendar_month,
                        'Date:',
                        DateFormat.yMMMMd().format(booking.dateTime),
                      ),
                      const Divider(height: 20),
                      _buildDetailRow(
                        context,
                        Icons.access_time,
                        'Time:',
                        DateFormat.jm().format(booking.dateTime),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Done', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Text('$label ', style: Theme.of(context).textTheme.bodyLarge),
        const Spacer(),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
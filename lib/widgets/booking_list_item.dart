import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relish_style_booking/models/booking.dart';

/// A list item widget to display a single booking.
class BookingListItem extends StatelessWidget {
  final Booking booking;

  const BookingListItem({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
          child: Text(
            DateFormat('d').format(booking.dateTime),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          booking.service.name,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${DateFormat.MMM().format(booking.dateTime)} at ${DateFormat.jm().format(booking.dateTime)}',
          style: textTheme.bodyMedium,
        ),
        trailing: Text(
          '\$${booking.service.price.toStringAsFixed(2)}',
          style: textTheme.titleSmall?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
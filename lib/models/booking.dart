import 'package:relish_style_booking/models/hairstyle_service.dart';

/// Represents a confirmed appointment booking.
class Booking {
  final String id;
  final HairstyleService service;
  final DateTime dateTime;

  const Booking({
    required this.id,
    required this.service,
    required this.dateTime,
  });
}
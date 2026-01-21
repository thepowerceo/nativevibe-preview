import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:relish_style_booking/models/booking.dart';
import 'package:relish_style_booking/models/hairstyle_service.dart';

/// Manages the state for services and bookings.
class BookingProvider extends ChangeNotifier {
  final List<HairstyleService> _services = [
    const HairstyleService(id: 's1', name: 'Classic Haircut', price: 45.0, durationInMinutes: 45, imageUrl: 'cut'),
    const HairstyleService(id: 's2', name: 'Beard Trim', price: 25.0, durationInMinutes: 30, imageUrl: 'beard'),
    const HairstyleService(id: 's3', name: 'Color & Style', price: 120.0, durationInMinutes: 90, imageUrl: 'color'),
    const HairstyleService(id: 's4', name: 'Kids Cut', price: 30.0, durationInMinutes: 30, imageUrl: 'kids'),
  ];

  final List<Booking> _bookings = [];

  /// A read-only view of the available hairstyle services.
  UnmodifiableListView<HairstyleService> get services => UnmodifiableListView(_services);

  /// A read-only view of the user's bookings, sorted by date.
  UnmodifiableListView<Booking> get bookings {
    _bookings.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return UnmodifiableListView(_bookings);
  }

  /// Adds a new booking to the list and notifies listeners.
  void addBooking(Booking newBooking) {
    _bookings.add(newBooking);
    notifyListeners();
  }
}
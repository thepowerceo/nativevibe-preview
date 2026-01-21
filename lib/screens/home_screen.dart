import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relish_style_booking/models/booking.dart';
import 'package:relish_style_booking/providers/booking_provider.dart';
import 'package:relish_style_booking/screens/booking_screen.dart';
import 'package:relish_style_booking/widgets/booking_list_item.dart';
import 'package:relish_style_booking/widgets/service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingProvider = context.watch<BookingProvider>();
    final services = bookingProvider.services;
    final bookings = bookingProvider.bookings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Relish Style'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(context, 'Our Services'),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: services.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceCard(
                  service: service,
                  onTap: () => _navigateToBooking(context, service),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader(context, 'My Bookings'),
          const SizedBox(height: 12),
          _buildBookingsList(context, bookings),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildBookingsList(BuildContext context, List<Booking> bookings) {
    if (bookings.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'You have no upcoming bookings.\nSelect a service to get started!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bookings.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return BookingListItem(booking: bookings[index]);
      },
    );
  }

  void _navigateToBooking(BuildContext context, service) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingScreen(service: service),
      ),
    );
  }
}
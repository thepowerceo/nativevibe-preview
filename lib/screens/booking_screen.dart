import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:relish_style_booking/models/booking.dart';
import 'package:relish_style_booking/models/hairstyle_service.dart';
import 'package:relish_style_booking/providers/booking_provider.dart';
import 'package:relish_style_booking/screens/confirmation_screen.dart';

class BookingScreen extends StatefulWidget {
  final HairstyleService service;

  const BookingScreen({super.key, required this.service});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<TimeOfDay> _timeSlots = List.generate(
    18, // 9 AM to 5:30 PM in 30-min intervals
    (index) => TimeOfDay(hour: 9 + (index ~/ 2), minute: (index % 2) * 30),
  );

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 60)),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _bookAppointment() {
    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a date and time.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final bookingDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final newBooking = Booking(
      id: DateTime.now().toIso8601String(),
      service: widget.service,
      dateTime: bookingDateTime,
    );

    context.read<BookingProvider>().addBooking(newBooking);

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => ConfirmationScreen(booking: newBooking),
      ),
      (Route<dynamic> route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('Book ${widget.service.name}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.calendar_today, color: colorScheme.primary),
              title: const Text('Select Date'),
              subtitle: Text(
                _selectedDate == null ? 'Choose a date' : DateFormat.yMMMMd().format(_selectedDate!),
              ),
              onTap: _pickDate,
              trailing: const Icon(Icons.arrow_drop_down),
            ),
            const Divider(height: 30),
            Text('Select Time', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _timeSlots.map((time) {
                final isSelected = _selectedTime == time;
                return ChoiceChip(
                  label: Text(time.format(context)),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedTime = selected ? time : null;
                    });
                  },
                  selectedColor: colorScheme.primary,
                  labelStyle: TextStyle(
                    color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
          onPressed: _bookAppointment,
          child: const Text('Confirm Booking', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
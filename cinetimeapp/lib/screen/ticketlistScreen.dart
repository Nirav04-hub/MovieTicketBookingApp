import 'package:flutter/material.dart';
import 'package:cinetimeapp/services/booking_dbhelper.dart';
import 'package:cinetimeapp/models/booking.dart';
import 'package:cinetimeapp/widgets/appDrawer.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  List<Booking> bookings = [];

  @override
  void initState() {
    super.initState();
    _loadBookings();
  }

  void _loadBookings() async {
    final data = await BookingDatabase.getAllBookings();
    setState(() {
      bookings = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("My Tickets"),
        backgroundColor: Colors.redAccent,
      ),
      body: bookings.isEmpty
          ? const Center(child: Text("No bookings found."))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(booking.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email: ${booking.email}"),
                        Text("Phone: ${booking.phone}"),
                        Text("Tickets: ${booking.tickets}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

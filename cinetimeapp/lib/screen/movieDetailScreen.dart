import 'package:flutter/material.dart';
import 'package:cinetimeapp/widgets/appDrawer.dart';
import 'ticket_booking_screen.dart'; // 👈 make sure this import is correct

class MovieDetailScreen extends StatelessWidget {
  final Map<String, String> movie;

  const MovieDetailScreen({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Movie Details"),
        backgroundColor: Colors.redAccent,
      ),
      drawerScrimColor: Colors.black.withOpacity(0.4),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Movie Poster
            Image.network(
              movie['image'] ?? '',
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.broken_image, size: 100),
            ),
            const SizedBox(height: 16),

            // Movie Title
            Text(
              movie['title'] ?? 'No Title',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Placeholder Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoBox("Length", "1H 56MIN"),
                _buildInfoBox("Rating", "14 A"),
                _buildInfoBox("Genre", "Action, Thriller"),
              ],
            ),
            const SizedBox(height: 20),

            // Overview
            Text(
              movie['overview'] ?? 'No description available.',
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 30),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text("Back To Movies"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const TicketBookingScreen()),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Reserve Now"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(value),
        ),
      ],
    );
  }
}

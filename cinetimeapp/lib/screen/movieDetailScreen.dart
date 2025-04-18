import 'package:flutter/material.dart';
import 'package:cinetimeapp/widgets/appDrawer.dart';

class MovieDetailScreen extends StatelessWidget {
  final Map<String, String> movie;

  const MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: Colors.redAccent,
      ),
      drawer: AppDrawer(),
      drawerScrimColor: Colors.black.withOpacity(0.4),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Movie Poster
            Image.network(
              movie['image'] ?? '',
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Icon(Icons.broken_image, size: 100),
            ),
            SizedBox(height: 16),

            // Movie Title
            Text(
              movie['title'] ?? 'No Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Metadata Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoBox("Length", "1H 56MIN"),
                _buildInfoBox("Rating", "14 A"),
                _buildInfoBox("Genre", "Action, Thriller"),
              ],
            ),
            SizedBox(height: 20),

            // Overview
            Text(
              movie['overview'] ?? 'No description available.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 30),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                  ),
                  child: Text("Back To Movies"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to Reservation Screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text("Reserve Now"),
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
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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

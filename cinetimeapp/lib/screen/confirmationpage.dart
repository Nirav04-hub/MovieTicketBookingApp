import 'package:flutter/material.dart';
import 'package:cinetimeapp/widgets/appDrawer.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          height: 450,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: BorderRadius.circular(100),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Booking Confirmed',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(16),
                child: const Icon(Icons.check, size: 40, color: Colors.black),
              ),
              const SizedBox(height: 40),
              const Text(
                "*note: show the booking confirmation at the venue to select your seats. Thank you!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

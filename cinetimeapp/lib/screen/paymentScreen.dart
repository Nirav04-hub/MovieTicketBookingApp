import 'package:flutter/material.dart';
import 'package:cinetimeapp/widgets/appDrawer.dart';
import 'package:cinetimeapp/screen/confirmationpage.dart';

class PaymentScreen extends StatelessWidget {
  final String name;
  final String email;
  final int tickets;
  final int pricePerTicket = 120;

  const PaymentScreen({
    super.key,
    required this.name,
    required this.email,
    required this.tickets,
  });

  @override
  Widget build(BuildContext context) {
    int total = tickets * pricePerTicket;

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Booking Summary",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _buildInfoRow("Name:", name),
              _buildInfoRow("Email:", email),
              _buildInfoRow("Tickets:", tickets.toString()),
              _buildInfoRow("Price/Ticket:", "₹$pricePerTicket"),
              const Divider(thickness: 2),
              _buildInfoRow("Total:", "₹$total", isBold: true),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ConfirmationScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text("Pay"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cinetimeapp/models/booking.dart';
import 'package:cinetimeapp/services/booking_dbhelper.dart';
import 'package:cinetimeapp/widgets/appDrawer.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ticketsController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _cardController = TextEditingController();
  final _cvvController = TextEditingController();
  final _expiryController = TextEditingController();

  void _saveBooking() async {
    if (_formKey.currentState!.validate()) {
      final booking = Booking(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        tickets: int.parse(_ticketsController.text),
        postalCode: _postalCodeController.text,
        cardNumber: _cardController.text,
        cvv: _cvvController.text,
        expiryDate: _expiryController.text,
      );

      await BookingDatabase.insertBooking(booking);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Booking confirmed!")),
      );

      _formKey.currentState!.reset();
    }
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextFormField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          validator: (value) =>
              value == null || value.isEmpty ? 'Required' : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Booking Confirmation'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Enter Details",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                _buildTextField("Name", _nameController),
                _buildTextField("E-mail", _emailController),
                _buildTextField("Phone No.", _phoneController, isNumber: true),
                _buildTextField("Number Of Tickets", _ticketsController,
                    isNumber: true),
                _buildTextField("Postal Code", _postalCodeController),
                _buildTextField("Card Number", _cardController, isNumber: true),
                Row(
                  children: [
                    Expanded(
                        child: _buildTextField("CVV", _cvvController,
                            isNumber: true)),
                    SizedBox(width: 10),
                    Expanded(
                        child:
                            _buildTextField("Expiry Date", _expiryController)),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _saveBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: Text("Confirm"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

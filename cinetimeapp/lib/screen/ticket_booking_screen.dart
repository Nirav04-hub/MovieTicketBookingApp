import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cinetimeapp/widgets/appDrawer.dart';
import 'package:cinetimeapp/screen/bookingscreen.dart';

class TicketBookingScreen extends StatefulWidget {
  const TicketBookingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TicketBookingScreenState createState() => _TicketBookingScreenState();
}

class _TicketBookingScreenState extends State<TicketBookingScreen> {
  final TextEditingController _cityController =
      TextEditingController(text: "Waterloo");
  final TextEditingController _dateController = TextEditingController();
  GoogleMapController? _mapController;

  final LatLng _defaultCenter = LatLng(43.4643, -80.5204); // Waterloo
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _dateController.text =
        "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Widget _buildShowtimeCard(String theater, List<String> times) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(theater,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Wrap(
            spacing: 10,
            children: times.map((time) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingScreen(),
                    ),
                  );
                },
                child: Text(time),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Tickets"),
        backgroundColor: Colors.redAccent,
      ),
      drawer: AppDrawer(),
      // ignore: deprecated_member_use
      drawerScrimColor: Colors.black.withOpacity(0.4),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            // Location + Date Input
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      hintText: "Enter city",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: _selectDate,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Optional: Animate map if needed
                      _mapController?.animateCamera(
                        CameraUpdate.newLatLng(_defaultCenter),
                      );
                    },
                    icon: Icon(Icons.search),
                    label: Text("Search"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Map
            Container(
              height: 250,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _defaultCenter,
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("waterloo"),
                    position: LatLng(43.4643, -80.5204),
                    infoWindow: InfoWindow(title: "Galaxy Cinemas Waterloo"),
                  ),
                  Marker(
                    markerId: MarkerId("kitchener"),
                    position: LatLng(43.4516, -80.4925),
                    infoWindow: InfoWindow(title: "Galaxy Cinemas Kitchener"),
                  ),
                },
              ),
            ),
            SizedBox(height: 20),

            // Showtimes
            _buildShowtimeCard(
                "Galaxy Cinemas Waterloo", ["4:15 pm", "6:50 pm", "9:30 pm"]),
            _buildShowtimeCard("Galaxy Cinemas Kitchener",
                ["4:15 pm", "7:00 pm", "7:45 pm", "9:55 pm"]),
          ],
        ),
      ),
    );
  }
}

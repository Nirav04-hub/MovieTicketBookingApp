import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a loading time of 3 seconds before navigating
    Timer(Duration(seconds: 3), () {
      // TODO: Replace with the next screen later
      print("Navigate to next screen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Feel free to change
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Icon
            Image.asset(
              'assets/logo/logo.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 30),
            // App Title
            Text(
              'CineTime',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

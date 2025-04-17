import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    //Rotation animation
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();

    Timer(Duration(seconds: 5), () {
      // TODO: Replace with your next screen
      print("Navigate to next screen");
    });
  }

  @override
  void dispose() {
    controller.dispose(); // Cleanup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rotating Logo
            RotationTransition(
              turns: controller,
              child: Image.asset(
                'assets/logo/logo.png',
                width: 120,
                height: 120,
              ),
            ),
            SizedBox(height: 30),
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

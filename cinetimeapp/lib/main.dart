import 'package:flutter/material.dart';
import 'package:cinetimeapp/screen/spalshScreen.dart';

void main() {
  runApp(CineTimeApp());
}

class CineTimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cine Time",
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen());
  }
}

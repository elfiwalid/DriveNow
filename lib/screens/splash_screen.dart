import 'package:flutter/material.dart';
import 'dart:async';
import 'intro_screen_1.dart';  // Ensure this import points to your IntroScreen1 file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => IntroScreen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: Image.asset('lib/assets/1.png'), // Your splash screen image
      ),
    );
  }
}

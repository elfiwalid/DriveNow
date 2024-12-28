import 'package:flutter/material.dart';
import 'intro_screen_2.dart'; // Import the next screen

class IntroScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, // Remove the shadow beneath the AppBar
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/2.png', // Replace with your actual image path
              height: 200, // Adjust the height as needed
            ),
            SizedBox(height: 40),
            Text(
              'Easy access',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Cette application vous permet de réserver des véhicules rapidement et facilement.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntroScreen2()), // Navigate to IntroScreen2
                );
              },
              child: Icon(Icons.arrow_forward , color: Colors.black),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.teal, // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

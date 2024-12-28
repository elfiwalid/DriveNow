import 'package:flutter/material.dart';
import 'illustration_screen.dart'; // Importez IllustrationScreen

class IntroScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/3.jpg', // Assurez-vous que ce chemin correspond à l'emplacement de votre image
              height: 300, // Ajuster la hauteur selon vos besoins
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 40),
            Text(
              'Réservez Sans Effort',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Réservez votre véhicule de manière fluide et sans tracas. Notre application vous offre une expérience de réservation simplifiée avec un accès facile.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IllustrationScreen()), // Naviguer vers IllustrationScreen
                );
              },
              child: Text(
                'GO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.teal, // Couleur du bouton
              ),
            ),
          ],
        ),
      ),
    );
  }
}

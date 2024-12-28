import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Log in', style: TextStyle(color: Colors.white)),
        elevation: 0,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Espacement supérieur pour centrer l'image
              SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'lib/assets/1.png', // Remplacez par le chemin correct de votre image
                  height: 150, // Ajustez la taille de l'image selon vos besoins
                ),
              ),
              SizedBox(height: 40), // Espacement après l'image
              _buildTextField('Email'),
              SizedBox(height: 20), // Espacement entre les champs
              _buildTextField('Password', obscureText: true),
              SizedBox(height: 30), // Espacement avant le bouton
              _buildGradientButton(context),
              SizedBox(height: 20), // Espacement inférieur
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup'); // Navigation vers la page d'inscription
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espacement inférieur
            ],
          ),
        ),
      ),
    );
  }

  // Fonction pour créer les champs de texte avec une apparence uniforme
  Widget _buildTextField(String hintText, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }

  // Fonction pour créer un bouton avec un dégradé
  Widget _buildGradientButton(BuildContext context) {
    return InkWell(
      onTap: () {
        // Action pour se connecter
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal,
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.4),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Log in',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

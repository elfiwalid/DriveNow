import 'package:flutter/material.dart';
import 'car_list_screen.dart';       // Importez les fichiers nécessaires pour chaque écran
import 'historique.dart';
import 'notifications.dart';
import 'profile_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PersonalInfoScreen(),
  ));
}

// Écran d'informations personnelles
class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // Variable pour suivre l'index sélectionné dans la BottomNavigationBar
  int _selectedIndex = 0;

  // Méthode pour gérer la sélection de la BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Naviguer vers l'écran correspondant en fonction de l'index sélectionné
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CarListScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ReservationHistoryApp()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => VehicleReservationApp()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Informations Personnelles',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('Nom', nameController),
            SizedBox(height: 20), // Espacement entre les champs
            _buildTextField('Prénom', surnameController),
            SizedBox(height: 20),
            _buildTextField('Email', emailController),
            SizedBox(height: 20),
            _buildTextField('Téléphone', phoneController),
            SizedBox(height: 20),
            _buildTextField('Adresse', addressController),
            SizedBox(height: 20),
            _buildUploadButton('Télécharger votre carte d\'identité'),
            SizedBox(height: 20),
            _buildUploadButton('Télécharger votre permis de conduire'),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logique pour sauvegarder les informations
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Sauvegarder',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Utilisation de la BottomNavigationBar définie
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // Fonction pour créer un champ de texte
  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Fonction pour créer un bouton de téléchargement
  Widget _buildUploadButton(String label) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Logique pour télécharger un fichier
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

// Classe BottomNavBar pour gérer la navigation
class BottomNavBar extends StatelessWidget {
  final int currentIndex; // Index actuel de la BottomNavigationBar
  final Function(int) onTap; // Fonction de callback pour gérer les taps

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Met à jour l'index sélectionné
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      onTap: onTap, // Appelle la fonction onTap fournie lors du tap
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          label: 'Cars',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Historique',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

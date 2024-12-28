import 'package:flutter/material.dart';
import 'car_list_screen.dart';
import 'notifications.dart';
import 'historique.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Profile'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo de profil et nom
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('lib/assets/profile.jpeg'), // Image de profil
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Walid El Filali',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'walid.elfilali00@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Section Information Personnelle
              Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildInfoRow('Nom Complet', 'El Filali Walid', Icons.person),
                      Divider(),
                      _buildInfoRow('Email', 'walid.elfilali00@gmail.com', Icons.email),
                      Divider(),
                      _buildInfoRow('Phone ', '+212 070000000', Icons.phone),
                      Divider(),
                      _buildInfoRow('Address', '202 Essalam Oulfa , Casablanca', Icons.home),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Section Paramètres de compte
              Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              _buildSettingOption('Changer Password', Icons.lock, () {
                // Action pour changer le mot de passe
              }),
              _buildSettingOption('Privacy Settings', Icons.privacy_tip, () {
                // Action pour les paramètres de confidentialité
              }),
              _buildSettingOption('Notification Settings', Icons.notifications, () {
                // Action pour les paramètres de notification
              }),
              _buildSettingOption('Language', Icons.language, () {
                // Action pour changer la langue
              }),
              SizedBox(height: 30),

              // Bouton Déconnexion
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Action pour se déconnecter
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Déconnecter',
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
      ),
      bottomNavigationBar: BottomNavBar(), // Ajout de la barre de navigation
    );
  }

  // Fonction pour construire une ligne d'information personnelle
  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  // Fonction pour construire une option de paramètre
  Widget _buildSettingOption(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }
}

// Bottom Navigation Bar
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0; // Index de l'élément sélectionné

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex, // Met à jour l'index sélectionné
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index; // Met à jour l'index sélectionné
        });

        // Navigue vers l'écran correspondant à l'index
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
      },
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

// Main Function
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
  ));
}

import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'car_list_screen.dart';
import 'notifications.dart';

void main() {
  runApp(ReservationHistoryApp());
}

class ReservationHistoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historique des Réservations',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white, // Fond blanc
      ),
      home: ReservationHistoryScreen(),
    );
  }
}

class ReservationHistoryScreen extends StatelessWidget {
  // Exemple de données pour les réservations avec images
  final List<Reservation> reservations = [
    Reservation(
      vehicleName: 'Toyota Corolla',
      date: '2024-09-01',
      status: 'Complétée',
      imageUrl: 'lib/assets/5.png', // Assurez-vous d'avoir cette image
    ),
    Reservation(
      vehicleName: 'Honda Civic',
      date: '2024-09-10',
      status: 'Annulée',
      imageUrl: 'lib/assets/6.png', // Assurez-vous d'avoir cette image
    ),
    Reservation(
      vehicleName: 'Ford Fiesta',
      date: '2024-09-15',
      status: 'En attente',
      imageUrl: 'lib/assets/6.png', // Assurez-vous d'avoir cette image
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des Réservations', style: TextStyle(color: Colors.black)), // Texte noir
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Icône de retour
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(reservations[index].imageUrl, width: 50, height: 50), // Image du véhicule
              title: Text(reservations[index].vehicleName, style: TextStyle(color: Colors.black)),
              subtitle: Text('Date: ${reservations[index].date}', style: TextStyle(color: Colors.black)),
              trailing: Text(
                reservations[index].status,
                style: TextStyle(
                  color: reservations[index].status == 'Complétée'
                      ? Colors.green
                      : reservations[index].status == 'Annulée'
                          ? Colors.red
                          : Colors.orange,
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(), // Ajout de la barre de navigation
    );
  }
}

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

class Reservation {
  final String vehicleName;
  final String date;
  final String status;
  final String imageUrl; // URL de l'image

  Reservation({required this.vehicleName, required this.date, required this.status, required this.imageUrl});
}

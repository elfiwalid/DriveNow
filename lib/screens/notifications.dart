import 'package:flutter/material.dart';
import 'historique.dart';
import 'car_list_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(VehicleReservationApp());
}

class VehicleReservationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Réservation de Véhicules',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white, // Fond blanc
      ),
      home: VehicleListScreen(),
    );
  }
}

class VehicleListScreen extends StatelessWidget {
  final List<Vehicle> vehicles = [
    Vehicle(
      name: 'Toyota Corolla',
      imageUrl: 'lib/assets/5.png',
      pickupLocation: 'Aéroport de Fés-sais',
      reservationDate: '2024-09-28',
    ),
    Vehicle(
      name: 'Honda Civic',
      imageUrl: 'lib/assets/6.png',
      pickupLocation: 'Gare Casa Voyageure',
      reservationDate: '2024-10-05',
    ),
    Vehicle(
      name: 'Ford Fiesta',
      imageUrl: 'lib/assets/7.png',
      pickupLocation: 'Centre-ville Tanger',
      reservationDate: '2024-10-10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Véhicules Disponibles', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(vehicles[index].imageUrl, width: 50, height: 50),
              title: Text(vehicles[index].name, style: TextStyle(color: Colors.black)),
              subtitle: Text('Lieu: ${vehicles[index].pickupLocation}', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReservationDetailScreen(vehicle: vehicles[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class ReservationDetailScreen extends StatelessWidget {
  final Vehicle vehicle;

  ReservationDetailScreen({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Réservation', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Véhicule: ${vehicle.name}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Image.asset(vehicle.imageUrl),
            SizedBox(height: 20),
            Text('Date de Réservation: ${vehicle.reservationDate}', style: TextStyle(fontSize: 18)),
            Text('Lieu de Prise en Charge: ${vehicle.pickupLocation}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Réservation confirmée !')));
              },
              child: Text('Confirmer Réservation'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white,),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
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

class Vehicle {
  final String name;
  final String imageUrl;
  final String pickupLocation;
  final String reservationDate;

  Vehicle({
    required this.name,
    required this.imageUrl,
    required this.pickupLocation,
    required this.reservationDate,
  });
}

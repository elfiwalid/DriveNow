import 'package:flutter/material.dart';
import 'car_booking_screen.dart';
import 'profile_screen.dart';
import 'historique.dart';
import 'notifications.dart';

// Car List Screen (Main Screen)
class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Wo',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Voiture',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'lib/assets/1.png', // Add the logo here
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location Intelligente,\nAvenir Prometteur.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search car here',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Filter Categories
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChip(text: "All"),
                  FilterChip(text: "Sedan"),
                  FilterChip(text: "SUV"),
                  FilterChip(text: "MPV"),
                  FilterChip(text: "Hatchback"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Most Rented Cars',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            // Expanded to make the list scrollable
            Expanded(
              child: ListView(
                children: [
                  CarCard(
                    name: 'Toyota Corolla Altis',
                    type: 'Automatic/Manual',
                    price: '350dh/day',
                    imagePath: 'lib/assets/5.png',
                    renterName: 'El Filali Walid',
                    maxPower: '200 HP',
                    topSpeed: '220 km/h',
                    motor: '2500 cc',
                    features: ['Music', 'Manual', '5 seater', 'Full Tank'],
                  ),
                  CarCard(
                    name: 'Hyundai Tucson',
                    type: 'Automatic/Manual',
                    price: '500dh/day',
                    imagePath: 'lib/assets/6.png',
                    renterName: 'El Filali Walid',
                    maxPower: '220 HP',
                    topSpeed: '240 km/h',
                    motor: '2800 cc',
                    features: ['Music', 'Manual', '5 seater', 'Full Tank'],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

// Filter Chip Widget
class FilterChip extends StatelessWidget {
  final String text;

  FilterChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        onPressed: () {
          // Action for each filter
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.teal),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

// Car Card Widget
class CarCard extends StatelessWidget {
  final String name;
  final String type;
  final String price;
  final String imagePath;
  final String renterName;
  final String maxPower;
  final String topSpeed;
  final String motor;
  final List<String> features;

  CarCard({
    required this.name,
    required this.type,
    required this.price,
    required this.imagePath,
    required this.renterName,
    required this.maxPower,
    required this.topSpeed,
    required this.motor,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailScreen(
              name: name,
              imagePath: imagePath,
              price: price,
              renterName: renterName,
              maxPower: maxPower,
              topSpeed: topSpeed,
              motor: motor,
              features: features,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.symmetric(vertical: 10),
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        type,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Car Detail Screen
class CarDetailScreen extends StatelessWidget {
  final String name;
  final String imagePath;
  final String price;
  final String renterName;
  final String maxPower;
  final String topSpeed;
  final String motor;
  final List<String> features;

  CarDetailScreen({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.renterName,
    required this.maxPower,
    required this.topSpeed,
    required this.motor,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,  // Fond blanc
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image de la voiture
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imagePath,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              // Nom et Prix de la voiture
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              
              // Évaluation avec étoiles
              Row(
                children: List.generate(5, (index) => Icon(Icons.star, color: Colors.teal, size: 18)),
              ),
              SizedBox(height: 20),
              
              // Informations sur le loueur
              Text(
                'Renter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                color: Colors.white,  // Fond blanc
                margin: EdgeInsets.only(top: 10),
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.teal, size: 40),
                      SizedBox(width: 10),
                      Text(
                        renterName,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              // Section des spécifications
              Text(
                'Specifications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                color: Colors.white,  // Fond blanc
                margin: EdgeInsets.only(top: 10),
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildSpecRow('Max Power', maxPower, Icons.bolt),
                      Divider(),
                      _buildSpecRow('Top Speed', topSpeed, Icons.speed),
                      Divider(),
                      _buildSpecRow('Motor', motor, Icons.settings),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              
              // Bouton continuer
              Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarBookingScreen(), // Redirection vers la nouvelle page
                         ),
                        );
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Continue',
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
      // Barre de navigation inférieure
      bottomNavigationBar: BottomNavBar(),
    );
  }

  // Fonction pour construire une ligne de spécification avec une icône
  Row _buildSpecRow(String label, String value, IconData icon) {
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
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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


// Main Function
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CarListScreen(),
  ));
}

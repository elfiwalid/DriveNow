import 'package:flutter/material.dart';
import 'informations_personnel.dart';
import 'historique.dart';
import 'car_list_screen.dart';
import 'notifications.dart';
import 'profile_screen.dart';

// Car Booking Screen
class CarBookingScreen extends StatefulWidget {
  @override
  _CarBookingScreenState createState() => _CarBookingScreenState();
}

class _CarBookingScreenState extends State<CarBookingScreen> {
  TextEditingController pickupLocationController = TextEditingController();
  TextEditingController returnLocationController = TextEditingController();
  TextEditingController pickupDateTimeController = TextEditingController();
  TextEditingController returnDateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          'Toyota Corolla Altis', // Replace with your car title
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false, // Center the title
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Car Image
              Center(
                child: Image.asset(
                  'lib/assets/5.png', // Replace with your image path
                  height: 180,
                ),
              ),
              SizedBox(height: 10),

              // 'With Driver' Text
              Center(
                child: Text(
                  'With Driver',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: 20),

              // Pickup Location Input
              _buildTextField('Pick up location', 'Choose pick up location', pickupLocationController),
              SizedBox(height: 15),

              // Return Location Input
              _buildTextField('Return location', 'Choose return location', returnLocationController),
              SizedBox(height: 15),

              // Pickup Date and Time Input
              _buildDateTimeField('Pick up Date & time', 'Choose pick up date & time', pickupDateTimeController),
              SizedBox(height: 15),

              // Return Date and Time Input
              _buildDateTimeField('Return Date & time', 'Choose return date & time', returnDateTimeController),
              SizedBox(height: 30),

              // Continue Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalInfoScreen(), // Redirect to the new page
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
      bottomNavigationBar: BottomNavBar(), // Ajout de la barre de navigation en bas
    );
  }

  // Method to build text field for locations
  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // Method to build date & time input fields
  Widget _buildDateTimeField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          onTap: () async {
            // Date & Time Picker
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );

            if (pickedDate != null) {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (pickedTime != null) {
                DateTime fullDateTime = DateTime(
                  pickedDate.year,
                  pickedDate.month,
                  pickedDate.day,
                  pickedTime.hour,
                  pickedTime.minute,
                );
                controller.text = fullDateTime.toString(); // Format it as needed
              }
            }
          },
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CarBookingScreen(),
  ));
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

import 'package:flutter/material.dart';

class CarDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Action for share button
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                '/mnt/data/8.png', // Path to the car image
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Corrola V8',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.teal, size: 20),
                    Icon(Icons.star, color: Colors.teal, size: 20),
                    Icon(Icons.star, color: Colors.teal, size: 20),
                    Icon(Icons.star, color: Colors.teal, size: 20),
                    Icon(Icons.star, color: Colors.teal, size: 20),
                  ],
                ),
                Text(
                  '\$30/day',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Renter',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 20,
                ),
                SizedBox(width: 10),
                Text('El Filali Walid'),
                Spacer(),
                Icon(Icons.phone, color: Colors.teal),
                SizedBox(width: 10),
                Icon(Icons.chat_bubble, color: Colors.teal),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Spécification',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpecBox(label: 'Max Power', value: '200 HP'),
                SpecBox(label: 'Top Speed', value: '220 km/h'),
                SpecBox(label: 'Motor', value: '2500 cc'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Features',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.music_note, color: Colors.teal),
                Text('Music'),
                SizedBox(width: 20),
                Text('Manual'),
                SizedBox(width: 20),
                Text('5 seater'),
                SizedBox(width: 20),
                Text('Full Tank'),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Action on Continue
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.teal, // Button color
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Specification Box
class SpecBox extends StatelessWidget {
  final String label;
  final String value;

  SpecBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CarDetailScreen(),
  ));
}

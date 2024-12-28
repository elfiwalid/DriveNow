import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/intro_screen_1.dart';
import 'screens/intro_screen_2.dart';
import 'screens/illustration_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/car_list_screen.dart' as CarList;
import 'screens/car_detail.dart';
import 'screens/car_booking_screen.dart';
import 'screens/informations_personnel.dart';
import 'screens/profile_screen.dart';
import 'screens/historique.dart';
import 'screens/notifications.dart';

void main() {
  runApp(MyApp());
}

// Define the MyApp class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Reservation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/intro1': (context) => IntroScreen1(),
        '/intro2': (context) => IntroScreen2(),
        '/illustration': (context) => IllustrationScreen(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/car_list': (context) => CarList.CarListScreen(), // Use the prefix for CarListScreen
        '/car_detail': (context) => CarDetailScreen(),
        '/car_booking': (context) => CarBookingScreen(),
        '/informations_personnel': (context) => PersonalInfoScreen(),
        '/profile': (context) => ProfileScreen(),
        '/historique' : (context) => ReservationHistoryApp(),
        '/notification' : (context) => VehicleReservationApp(),
      },
    );
  }
}
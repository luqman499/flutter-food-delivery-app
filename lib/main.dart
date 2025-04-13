import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/screens/food_details_screen.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HelloFood',
      theme: ThemeData(primarySwatch: Colors.pink, useMaterial3: true),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/food_details': (context) => const FoodDetailsScreen(),
      },
    );
  }
}

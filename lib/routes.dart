import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_food_delivery/screens/login_screen.dart';
import 'package:flutter_food_delivery/screens/home_screen.dart';
import 'package:flutter_food_delivery/screens/food_details_screen.dart';
import 'package:flutter_food_delivery/screens/cart_screen.dart';
import 'package:flutter_food_delivery/screens/sign_up_screen.dart';

class AppRoutes {
  static final routes = {
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/food_details': (context) => const FoodDetailsScreen(),
    '/cart': (context) => const CartScreen(),
    '/signup': (context) => const SignUpScreen(),
  };

  static Future<String> getInitialRoute() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    return token != null ? '/home' : '/signup';
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print('Generating route for: ${settings.name}');
    return MaterialPageRoute(
      builder:
          (context) => Scaffold(
            body: Center(child: Text('Route not found: ${settings.name}')),
          ),
    );
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder:
          (context) => Scaffold(
            body: Center(child: Text('Unknown route: ${settings.name}')),
          ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/routes.dart';

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
      initialRoute: '/signup',
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      onUnknownRoute: AppRoutes.onUnknownRoute,
    );
  }
}

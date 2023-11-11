import 'package:flutter/material.dart';
import 'package:hospital/screens/home_screen.dart';
import 'package:hospital/screens/login_screen.dart';
//asegurando
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
      },
      initialRoute: 'login',
    );
  }
}

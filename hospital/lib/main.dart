import 'package:flutter/material.dart';
import 'package:hospital/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:hospital/screens/home_screen.dart';
import 'package:hospital/screens/login_screen.dart';
import 'package:hospital/screens/user_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        // Otros providers pueden ir aquí
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'user': (_) => EditUserScreen(),
        },
        initialRoute: 'login',
      ),
    );
  }
}


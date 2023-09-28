import 'package:delivery/screens/login_screen/login_screen.dart';
import 'package:delivery/screens/register/register.dart';
import 'package:delivery/screens/splach_screen/splach_screen2.dart';
import 'package:delivery/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        // brightness: Brightness.light,
      ),
      home:  const SplachScreen2(),
      initialRoute: 'SplachScreen2',
      routes: {
        '': (context) => const SplachScreen2(),
        'Login': (context) => const LoginScreen(),
        'Welcome': (context) => const WelcomeScreen(),
        'Registeer': (context) => const RegisteerScreen(),
      },
    );
  }
}

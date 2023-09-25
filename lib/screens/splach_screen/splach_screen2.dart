import 'dart:async';

import 'package:delivery/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplachScreen2 extends StatefulWidget {
  const SplachScreen2({super.key});

  @override
  State<SplachScreen2> createState() => _SplachScreen2State();
}

class _SplachScreen2State extends State<SplachScreen2> {
  @override
  void initState() {
    _go();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Center(child: Lottie.asset('assets/animation_json/delivery1.json')),
      ),
    );
  }

  void _go() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
    {}
  }
}

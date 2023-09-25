import 'package:flutter/material.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('assets/images/picography-diy-organic-candle-768x512.jpg'),
        Positioned(
            top: 50.0, // المسافة من الأعلى
            left: 20.0, // المسافة من اليسار
            child: Stack(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.red,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.green,
                ),
                Container(
                  width: 60.0,
                  height: 60.0,
                  color: Colors.blue,
                ),
              ],
            )),

        // أي عناصر إضافية تضاف إلى Stack
      ],
    ));
  }
}

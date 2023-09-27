import 'package:flutter/material.dart';

class RegisteerScreen extends StatefulWidget {
  const RegisteerScreen({super.key});

  @override
  State<RegisteerScreen> createState() => _RegisteerScreenState();
}

class _RegisteerScreenState extends State<RegisteerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 225, 225, 225),
              child: IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'Login');
                },
                icon: const Icon(Icons.arrow_back_sharp),
              ),
            ),
            Stack(
              children: [
                Expanded(
                  child: Positioned(
                    
                    child: Image.asset(
                      'assets/images/logo.jpg',
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Text('mmmmmmmmmm')
              ],
            )
          ],
        ),
      ),
    ));
  }
}

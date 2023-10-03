import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: DrawerHeader(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logo.jpg'),
                )
              ],
            ),
            Divider(
              height: 2,
              thickness: 2,
            ),
            ListTile(),
          ],
        ),
      ),
    );
  }
}

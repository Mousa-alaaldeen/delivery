import 'package:delivery/screens/home/home_screen.dart';
import 'package:delivery/screens/setting/setting_screen.dart';
import 'package:delivery/screens/work/work_screen.dart';
import 'package:flutter/material.dart';

import '../../resources/icon_broken.dart';
import '../screens/drawer/drawer_scerrn.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    const BottomNavigationBarItem(icon: Icon(IconBroken.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(IconBroken.setting), label: 'Setting'),
    const BottomNavigationBarItem(icon: Icon(IconBroken.work), label: 'Work'),
  ];
  List<Widget> widgetScreen = [
    const HomeScreen(),
    const SettingScreen(),
    const WorkScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: widgetScreen[_selectedIndex],
      drawer: const DrawerScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {});
          _selectedIndex = value;
        },
        items: bottomNavigationBarItem,
        currentIndex: _selectedIndex,
      ),
    ));
  }
}

import 'package:flutter/material.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<WorkScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('WorkScreen'));
  }
}

import 'package:flutter/material.dart';
import 'package:iotprojector/drawer.dart';

class Bluetooth extends StatelessWidget {
  const Bluetooth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('Bluetooth'),
      ),
      drawer: const DrawerPage(),
    );
  }
}

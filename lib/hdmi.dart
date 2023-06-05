import 'package:flutter/material.dart';
import 'package:iotprojector/drawer.dart';

class HDMI extends StatelessWidget {
  const HDMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('HDMI'),

      ),
      drawer: const DrawerPage(),
    );
  }
}

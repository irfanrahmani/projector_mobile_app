import 'package:flutter/material.dart';
import 'package:iotprojector/drawer.dart';


class AnyCast extends StatelessWidget {
  const AnyCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('AnyCast'),
      ),
      drawer: const DrawerPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iotprojector/anycast_dongle.dart';
import 'package:iotprojector/drawer_header.dart';
import 'package:iotprojector/hdmi.dart';
import 'package:iotprojector/home_page.dart';

import 'bluetooth.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            children: <Widget>[
              MyHeaderDrawer(),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
                },
              ),
              ListTile(
                title: const Text('Bluetooth'),
                onTap: () {
                  // Do something
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Bluetooth()));
                },
              ),
              ListTile(
                title: const Text('HDMI'),
                onTap: () {
                  // Do something
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HDMI()));
                },
              ),
              ListTile(
                title: const Text('Any Cast m9 Plus'),
                onTap: () {
                  // Do something
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AnyCast()));
                },
              ),
            ],
          ),
        );
  }
}

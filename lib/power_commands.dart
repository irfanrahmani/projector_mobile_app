import 'dart:async';
//import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';


class PowerCommands extends StatefulWidget {
  const PowerCommands({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PowerCommandsState createState() => _PowerCommandsState();
}

class _PowerCommandsState extends State<PowerCommands> {
  List<BluetoothDevice> _devices = [];
  late BluetoothConnection connection;
  String adr = "00:21:07:00:50:69"; // my bluetooth device MAC Adres

  @override
  void initState() {
    super.initState();
    _loadDevices();
  }

  Future<void> _loadDevices() async {
    List<BluetoothDevice> devices = await FlutterBluetoothSerial.instance
        .getBondedDevices();

    setState(() {
      _devices = devices;
    });
  }

//----------------------------
  Future<void> sendData(String data) async {
    data = data.trim();
    try {
      List<int> list = data.codeUnits;
      Uint8List bytes = Uint8List.fromList(list);
      connection.output.add(bytes);
      await connection.output.allSent;
      if (kDebugMode) {
        // print('Data sent successfully');
      }
    } catch (e) {
      //print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Bluetooth Single LED Control"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("MAC Adress: 00:21:07:00:50:69"),

                ElevatedButton(child: Text("Connect"), onPressed: () {
                  connect(adr);
                },),
                SizedBox(height: 30.0,),

                ElevatedButton(child: Text(" OPEN "), onPressed: () {
                  sendData("on");
                },),

                SizedBox(height: 10.0,),
                ElevatedButton(child: Text("CLOSE"), onPressed: () {
                  sendData("off");
                },),
              ],
            ),
          ),


        )

    );
  }

  Future connect(String address) async {
    try {
      connection = await BluetoothConnection.toAddress(address);
      sendData('111');
      //durum="Connected to the device";
      connection.input!.listen((Uint8List data) {
        //Data entry point
        // durum=ascii.decode(data);
      });
    } catch (exception) {
      // durum="Cannot connect, exception occured";
    }
  }
}
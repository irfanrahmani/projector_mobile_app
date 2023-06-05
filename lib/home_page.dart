import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:iotprojector/drawer.dart';
import 'package:iotprojector/configuration.dart';
import 'package:iotprojector/which_pdf.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SpeechToText speech = SpeechToText();
  bool isListening = false;
  String text = 'Welcome';
  @override
  void initState() {
    super.initState();
    speech.initialize();
  }
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List Configurations = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Connect Bluetooth", "assets/icons/bluetooth.png", true],
    ["Switch Port to HDMI", "assets/icons/hdmi.png", false],
    ["Connect To M9 Plus", "assets/icons/dongle_m9.png", false],
    ["Power On Multimedia", "assets/icons/dongle_m9.png", true],
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      Configurations[index][2] = value;
    });
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerPage(),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // menu icon
                  // Image.asset(
                  //   'lib/icons/menu.png',
                  //   height: 45,
                  //   color: Colors.grey[800],
                  //
                  // ),
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    icon: Icon(Icons.menu,
                      size: 45,
                      color: Colors.grey[800],
                    ),
                  ),
                  // account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to ,",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  const Text(
                    'Smart Projector',
                    style: TextStyle(fontSize: 52),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),

            const SizedBox(height: 25),

            // smart devices grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Configuration",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // grid
            Expanded(
              child: GridView.builder(
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  return ConfigurationBox(
                    ConfigurationName: Configurations[index][0],
                    iconPath: Configurations[index][1],
                    powerOn: Configurations[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),

            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // do something
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WhichPdf()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Text('  Select Slide  ',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        onPressed: () {
          if (!isListening) {
            speech.listen(onResult: (result) {
              setState(() {
                text = result.recognizedWords;
              });
            });
            setState(() {
              isListening = true;
            });
          } else {
            speech.stop();
            setState(() {
              isListening = false;
            });
          }
          //Test part
          Fluttertoast.showToast(
            msg: parseVoiceCommands(text).toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          parseVoiceCommands(text);
          print(text);
          print(parseVoiceCommands(text));
        },
        child: Icon(isListening ? Icons.stop : Icons.mic),
      ),
    );
  }

  int parseVoiceCommands(String text) {
    String lowerCaseCommand = text.toLowerCase();

    if (lowerCaseCommand.contains("on") && lowerCaseCommand.contains("turn")
    && lowerCaseCommand.contains("multimedia")) {
      return 1;
    } else if (lowerCaseCommand.contains("off") && lowerCaseCommand.contains("turn")
    && lowerCaseCommand.contains("multimedia")) {
      return 0;
    } else {
      return 2;
    }
  }
}

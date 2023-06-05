import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/icons/google_account.png'),
              ),
            ),
          ),
          FloatingActionButton.extended(onPressed: () {},
            icon: Image.asset('assets/icons/google_account.png',
              height: 32,
              width: 32,
            ),
            backgroundColor: Colors.white,
            label: const Text('Sign In to Gmail',
              style: TextStyle(
                color: Colors.black,
              ),
            ),


            //Temporary comment this section 
            // Text(
            //   "Rapid Tech",
            //   style: TextStyle(color: Colors.white, fontSize: 20),
            // ),
            // Text(
            //   "info@rapidtech.dev",
            //   style: TextStyle(
            //     color: Colors.grey[200],
            //     fontSize: 14,
            //   ),
          ),
        ],
      ),
    );
  }
}

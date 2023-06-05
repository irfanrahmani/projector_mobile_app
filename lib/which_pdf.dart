import 'package:flutter/material.dart';
import 'package:iotprojector/asset_pdf.dart';
import 'package:iotprojector/drawer.dart';
import 'package:file_picker/file_picker.dart';


import 'package:iotprojector/pdf_url.dart';
class WhichPdf extends StatelessWidget {
  const WhichPdf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('PDF Selection'),
        centerTitle: true,
      ),
      drawer: const DrawerPage(),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Text('Please Select From Where You Want to Retreive the Slides',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey[800],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Image(
                image: const AssetImage('assets/icons/projector_image.jpeg'),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  child: ElevatedButton(
                    onPressed: () {
                    // do something
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PdfUrl()));
                    },
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Text('Load From Network',
                    style: TextStyle(
                    fontSize: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // do something
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AssetPdf()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text('Use Existing Slides',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () async {
                    // do something
                    // Pick a PDF file from internal storage.
                    final result = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );

                    // If the user picked a file, open it in a PDF viewer.
                    if (result != null && result.files.isNotEmpty) {
                      final file = result.files.first;
                      await openFile(file.path);
                    };
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text('Access Local Storage',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openFile(String? path) {}
}

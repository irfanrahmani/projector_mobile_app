import 'package:flutter/material.dart';
import 'package:iotprojector/network_pdf.dart';


class PdfUrl extends StatefulWidget {
  const PdfUrl({Key? key}) : super(key: key);

  @override
  State<PdfUrl> createState() => _PdfUrlState();
}

class _PdfUrlState extends State<PdfUrl> {
  final TextEditingController _textEditingController = TextEditingController();
  late String _url ;

  String get url => _url;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Dialog Box'),
      content: TextField(
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey,
                width: 3,
          ),
          ),
        ),
        controller: _textEditingController,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_textEditingController.text);
            _url = _textEditingController.text;
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => NetworkPDF(_url)));
            // print(_url);
          },
          child: Text('OK',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
          ),
        ),
      ],
    );
  }
}

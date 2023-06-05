import 'package:flutter/material.dart';
import 'package:iotprojector/drawer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AssetPdf extends StatefulWidget {
  const AssetPdf({Key? key}) : super(key: key);

  @override
  State<AssetPdf> createState() => _AssetPdfState();
}

class _AssetPdfState extends State<AssetPdf> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Asset PDF'),
      //   centerTitle: true,
      //   backgroundColor: Colors.grey[800],
      // ),
      drawer: const DrawerPage(),
      body: Container(

          padding: EdgeInsets.all(2),
          child: SfPdfViewer.asset(
          'assets/pdf/HCI_Presentation_Smart_Projector.pdf',
          controller: _pdfViewerController,
          key: _pdfViewerStateKey,
            pageLayoutMode: PdfPageLayoutMode.single,

        ),
      ),
    );
  }
}


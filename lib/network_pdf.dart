import 'package:path/path.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';
class NetworkPDF extends StatefulWidget {
  const NetworkPDF(String url, {key}) : super(key: key);

  @override
  State<NetworkPDF> createState() => _NetworkPDFState();
}

class _NetworkPDFState extends State<NetworkPDF> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pdf Viewer'),
      ),
      body: SfPdfViewer.network(
          url.toString(),
          controller: _pdfViewerController,
          key: _pdfViewerStateKey),
    );
  }
}
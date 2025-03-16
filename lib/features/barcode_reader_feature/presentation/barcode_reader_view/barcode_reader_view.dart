import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => ScanViewState();
}

class ScanViewState extends State<ScanView> {
  String? barcode;
  MobileScannerController cameraController = MobileScannerController();

  void onDetect(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty) {
      final String code = barcodes.first.rawValue!;
      setState(() {
        barcode = code;
      });
      cameraController.stop();
    }
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: MobileScanner(
          controller: cameraController,
          onDetect: onDetect,
        ),
      ),
    );
  }
}

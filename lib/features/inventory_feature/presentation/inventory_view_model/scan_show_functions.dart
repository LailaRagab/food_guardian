import 'package:barcode_scanner/classic_components.dart';
import 'package:barcode_scanner/rtu_ui_barcode_v2.dart';
import 'package:barcode_scanner/rtu_ui_common_v2.dart';
import 'package:barcode_scanner/scanbot_barcode_sdk.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';

class ScanFunctions {
  static Future<void> scan() async {
    try {
      final result = await BarcodeScannerCamera;
      if (result != null) {
        print('Scanned barcode: ${result}');
      }
    } catch (e) {
      print('Error scanning barcode: $e');
    }
  }

  static Widget show(){
    return BarcodeWidget(
        data: "Hello Flutter",
        barcode: Barcode.)
  }
}

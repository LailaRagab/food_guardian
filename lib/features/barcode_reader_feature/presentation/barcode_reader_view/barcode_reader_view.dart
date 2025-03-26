import 'package:flutter/material.dart';
import 'package:food_guardian/features/barcode_reader_feature/presentation/barcode_view_model/search_on_firestore.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../inventory_feature/presentation/inventory_view/inventory_widgets/custom_show_my_date_picker_widget.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => ScanViewState();
}

class ScanViewState extends State<ScanView> {
  String? barcode;
  MobileScannerController cameraController = MobileScannerController();
  DateTime? selectedExpirationDate;
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

  Future<void> onDetect(BarcodeCapture capture) async {
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty) {
      final String code = barcodes.first.rawValue!;
      setState(() {
        barcode = code;
      });
      cameraController.stop();

      await showDialogForDatePicker();

      if (mounted) {
        if (selectedExpirationDate != null && barcode != null) {
          await SearchOnFirestore.searchOnFirestore(
            barcode!,
            context,
            selectedExpirationDate!,
          );
        }
      }
    }
  }

  Future<void> showDialogForDatePicker() async {
    if (mounted) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: CustomShowMyDatePickerWidget(
            onDateSelected: (DateTime value) {
              setState(() {
                selectedExpirationDate = value;
              });
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
  }
}

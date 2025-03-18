import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/auth_snack_bar.dart';
import 'package:food_guardian/features/barcode_reader_feature/presentation/barcode_view_model/search_on_firestore.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';
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
      handleScannedBarcode(barcode!);
      cameraController.stop();
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    if (cameraController != null) {
      cameraController?.stop(); // Stop the scanner properly
    }
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

  Future<void> handleScannedBarcode(String barcode) async {
    try {
      final matchedItem = await getItemByBarcode(barcode);

      if (matchedItem != null) {
        // ✅ If item exists → add it as a new entry
        await addItemToFirestore(matchedItem);
        print('Item added again successfully!');
      } else {
        print('No matching item found');
        // ➡️ Optionally prompt user to add it manually
      }
    } catch (e) {
      print('Error handling barcode: $e');
    }
  }

  Future<void> addItemToFirestore(CardItemModel item) async {
    final inventoryCollection = FirebaseFirestore.instance
        .collection(CardItemModel.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('fridge'); // Change based on category

    await inventoryCollection.add({
      'name': item.itemName,
      'quantity': item.itemQuantity,
      'exDate': item.itemExpirationDate,
      'image': item.itemImage,
      'barcode': item.itemBarcode,
    });
  }

  Future<CardItemModel?> getItemByBarcode(String barcode) async {
    final inventoryCollection = FirebaseFirestore.instance
        .collection(CardItemModel.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('fridge'); // Change based on category

    final querySnapshot =
        await inventoryCollection.where('barcode', isEqualTo: barcode).get();

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;
      print('Fetched data: ${doc.data()}');
      return CardItemModel.fromJson(doc);
    } else {
      return null;
    }
  }
}

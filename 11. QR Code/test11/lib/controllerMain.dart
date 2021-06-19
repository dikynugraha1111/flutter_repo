import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

abstract class ControllerMain extends State<MyHomePage> {
  String codeScan;
  String hasil;

  Future<String> scanBarcode() async {
    hasil = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "CANCEL", true, ScanMode.QR);
    setState(() {
      codeScan = hasil;
    });
  }
}

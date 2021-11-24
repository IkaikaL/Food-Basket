import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scan/scan.dart';
import 'package:flutter/material.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({Key? key}) : super(key: key);

  @override
  BarCodeState createState() => BarCodeState();
}

class BarCodeState extends State<BarCodeScanner> {
  String scannnedIngredientID = "-1";

  Future<String> _scan() async {
    String barcodeScanRes;

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', false, ScanMode.BARCODE);
    print(barcodeScanRes);
    scannnedIngredientID = barcodeScanRes;
    return barcodeScanRes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Groceries Scanner'), centerTitle: true),
      body: const Center(
        child: Text(
          'Select the button below to start scanning Groceries.',
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        icon: const Icon(Icons.add),
        label: const Text('Start Scan'),
        onPressed: () => _scan(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

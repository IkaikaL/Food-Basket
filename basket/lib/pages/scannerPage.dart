import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutter/material.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({Key? key}) : super(key: key);

  @override
  BarCodeState createState() => BarCodeState();
}

class BarCodeState extends State<BarCodeScanner> {
  String? _data;

  Future _scan() async {
    /*return FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value) as String); */
    String _data;
    try {
      _data = (await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', false, ScanMode.BARCODE));
    } on PlatformException {
      _data = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() => this._data = _data);
  }

  /* @override
  void initState() {
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Groceries Scanner'), centerTitle: true),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[500],
                  onPrimary: Colors.black,
                ),
                icon: Icon(Icons.camera_alt_outlined),
                label: Text('StartScan'),
                onPressed: _scan,
              ),
              SizedBox(height: 20),
              Text(
                _data == null
                    ? 'Select the button below to start scanning Groceries.'
                    : 'Scan Result: $_data',
                style: TextStyle(fontSize: 22),
              )
            ]),
      ),
      /*floatingActionButton: ElevatedButton.icon(
        icon: const Icon(Icons.add),
        label: const Text('Start Scan'),
        onPressed: () => _scan(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
    );
  }
}

/*
  String _data = "1";

  Future<String> _scan() async {
    /*return FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value) as String); */
    String barcodeScanRes;

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', false, ScanMode.BARCODE);
    print(barcodeScanRes);
    _data = barcodeScanRes;
    return barcodeScanRes;
  }

  /* @override
  void initState() {
    super.initState();
  }*/

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
          */
/*import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({Key? key}) : super(key: key);

  @override
  BarCodeState createState() => BarCodeState();
}

class BarCodeState extends State<BarCodeScanner> {
  String _data = "";

  Future<String> _scan() async {
    return FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value) as String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () =>
              _scan(), //async => setState(() => _data = _scan() as String)
          child: const Text('Scan')),
      Text(_data)
    ]));
  }
}
*/
import 'package:flutter/widgets.dart';
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

  /* @override
  void initState() {
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Scanner'), centerTitle: true),
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
              child: const Text('Start Scan')),
          Text(_data)
        ]),
        floatingActionButton: ElevatedButton.icon(
          onPressed: () => _scan(),
          icon: const Icon(Icons.add),
          label: const Text('Start Scan'),
          //Text(_data) //commented this and changed from 44 down
        ));
  }
}

/*
floatingActionButton: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const addItemToInventoryManually()));
            refreshInventory();
            build(context);
          },
          icon: const Icon(Icons.add),
          label: const Text('add items'),
        )








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
              child: const Text('Start Scan')),
          Text(_data)
          */
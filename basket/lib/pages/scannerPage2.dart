import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:basket/database/app_database.dart';
import 'package:basket/database/ingredient.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({Key? key}) : super(key: key);

  @override
  BarCodeState createState() => BarCodeState();
}

class BarCodeState extends State<BarCodeScanner> {
  int demoIngredientID = 1;
  String? itemScanned = "null";

  refreshDisplay() {
    setState(() {});
  }

  Future<String> _scanScreen() async {
    String barcodeScanResult;

    barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', false, ScanMode.BARCODE);
    return barcodeScanResult;
  }

  Future<String> _setItemValueDEMO(demoIngredientID) async {
    switch (demoIngredientID) {
      case 1:
        {
          Timer(const Duration(seconds: 1), () {
            itemScanned = 'Soy Sauce';
            refreshDisplay();
            AppDatabase.instance.addIngredientInventory(const Ingredient(
              name: 'Soy Sauce',
              quantity: 1,
              unit: '666 grams',
              calories: 5,
              barcode: 000001,
            ));
            demoIngredientID = 2;
          });
        }
        break;
      case 2:
        {
          Timer(const Duration(seconds: 1), () {
            itemScanned = 'Rice';
            refreshDisplay();
            AppDatabase.instance.addIngredientInventory(const Ingredient(
              name: 'Rice',
              quantity: 1,
              unit: '2267 grams',
              calories: 164,
              barcode: 000002,
            ));
            demoIngredientID = 3;
          });
        }
        break;
      case 3:
        {
          Timer(const Duration(seconds: 1), () {
            itemScanned = 'Olive Oil';
            refreshDisplay();
            AppDatabase.instance.addIngredientInventory(const Ingredient(
              name: 'Olive Oil',
              quantity: 1,
              unit: '958 grams',
              calories: 120,
              barcode: 000003,
            ));
            demoIngredientID = 1;
          });
        }
        break;

      default:
        {
          return "Scanner Error ID: 01";
        }
    }
    return "Scanner Error ID: 02";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Groceries Scanner'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          itemScanned == "null"
              ? 'Select the button below to start scanning Groceries.'
              : 'Scan Result:  $itemScanned',
          style: const TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        icon: const Icon(Icons.add),
        label: const Text('Start Scan'),
        style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
        onPressed: () {
          _scanScreen();
          _setItemValueDEMO(demoIngredientID);
          demoIngredientID = demoIngredientID + 1;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

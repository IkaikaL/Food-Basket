// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';
// Routes
import 'package:basket/database/app_database.dart';
import 'package:basket/database/grocery_item.dart';

List<GroceryItem> groceries = [];

class GroceryPage extends StatefulWidget {
  const GroceryPage({Key? key}) : super(key: key);

  @override
  _GroceryPage createState() => _GroceryPage();
}

class _GroceryPage extends State<GroceryPage> {
  @override
  void initState() {
    super.initState();
    refreshGroceries();
  }

  Future refreshGroceries() async {
    groceries = await AppDatabase.instance.readAllGroceries();
    setState(() {});
  }

  String findWhichImageToUse(int index) {
    String groceryName = groceries[index].name;
    String fileFinder = 'assets/images/' + groceryName + '.jpg';
    return fileFinder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('Grocery List'),
        centerTitle: true,
        backgroundColor: (Colors.lightGreen),
      ),
      body: ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (context, indexOfGroceryList) {
          return Column(
            children: [
              Card(
                child: Column(
                  children: [
                    /*
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              findWhichImageToUse(indexOfGroceryList)),
                          child: InkWell(
                            onTap: () {},
                          ),
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),*/
                    SizedBox(height: 1),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 160,
                          child: Text(
                            groceries[indexOfGroceryList].name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 190,
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.black,
                            ),
                            child: Text(
                              'Remove',
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

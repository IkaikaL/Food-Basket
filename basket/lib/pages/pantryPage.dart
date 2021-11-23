// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
// Routes
import 'package:basket/database/app_database.dart';
import 'package:basket/database/ingredient.dart';

late int newQuantity;
late String nameOfItem;
late int quantityOfItem;
late double caloriesOfItem;

class pantryPage extends StatefulWidget {
  const pantryPage({Key? key}) : super(key: key);

  @override
  _pantryPage createState() => _pantryPage();
}

class _pantryPage extends State<pantryPage> {
  List<Ingredient> ingredients = [];
  late TextEditingController controller;
  //String item = 'Meatballs';
  //final String test = 'assets/images/' + item + 'jpeg';
  //int index = 1;
  @override
  void initState() {
    super.initState();
    refreshInventory();
  }

  Future refreshInventory() async {
    ingredients = await AppDatabase.instance.readAllInventory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    refreshInventory();
    return Scaffold(
        appBar: AppBar(title: const Text('Inventory'), centerTitle: true),
        body: ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  /*const Image(
                      image: AssetImage('assets/images/Meatballs.jpeg')),
                  */
                  ExpansionTile(
                    title: Text(ingredients[index].name),
                    children: [
                      ListTile(
                        title: Text('Name: ' + ingredients[index].name),
                      ),
                      ListTile(
                          title: Text('Quantity: ' +
                              ingredients[index].quantity.toString()),
                          trailing: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const changeQuantityManually()));
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text('edit'),
                          )),
                      ListTile(
                        title: Text('Calories: ' +
                            ingredients[index].calories.toString()),
                      ),
                    ],
                  ),
                ],
              );
            }),
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
          label: const Text('add item'),
        ));
  }
}

class addItemToInventoryManually extends StatefulWidget {
  const addItemToInventoryManually({Key? key}) : super(key: key);

  @override
  _addItemToInventoryManually createState() => _addItemToInventoryManually();
}

class _addItemToInventoryManually extends State<addItemToInventoryManually> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inventory Input'),
        ),
        body: Column(children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextField(
                onChanged: (value) => nameOfItem = value,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Ingredient Name',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ))),
              )),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextField(
                onChanged: (value) => quantityOfItem = int.parse(value),
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Ingredient Quantity',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ))),
              )),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextField(
                onChanged: (value) => caloriesOfItem = double.parse(value),
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Ingredient Calories',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ))),
              ))
        ]),
        floatingActionButton: ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const pantryPage()));
              AppDatabase.instance.addIngredientInventory(Ingredient(
                name: nameOfItem,
                quantity: quantityOfItem,
                unit: 'grams',
                calories: caloriesOfItem,
                barcode: 6969696,
              ));
            },
            icon: const Icon(Icons.done),
            label: const Text('Done')));
  }
}

class changeQuantityManually extends StatefulWidget {
  const changeQuantityManually({Key? key}) : super(key: key);

  @override
  _changeQuantityManually createState() => _changeQuantityManually();
}

class _changeQuantityManually extends State<changeQuantityManually> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Change Quantity'),
        ),
        body: Column(children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextField(
                onChanged: (value) => newQuantity = int.parse(value),
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'New Quantity',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ))),
              )),
        ]),
        floatingActionButton: ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const pantryPage()));
              AppDatabase.instance.addIngredientInventory(Ingredient(
                name: nameOfItem,
                quantity: newQuantity,
                unit: 'grams',
                calories: caloriesOfItem,
                barcode: 6969696,
              ));
            },
            icon: const Icon(Icons.done),
            label: const Text('Done')));
  }
}

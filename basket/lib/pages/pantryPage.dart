// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
// Routes
import 'package:basket/main.dart';
import 'package:basket/database/app_database.dart';
import 'package:basket/database/ingredient.dart';

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
  int index = 1;
  @override
  void initState() {
    super.initState();


    refreshInventory();
  }

  Future refreshInventory() async {
    ingredients = await AppDatabase.instance.readAllInventory();

    //testing statement
    //print(recipes.length);
    print(ingredients.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Inventory'), centerTitle: true),
        body: ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const Image(
                      image: AssetImage('assets/images/Meatballs.jpeg')),
                  ExpansionTile(
                    title: Text(ingredients[index].name),
                    children: [
                      ListTile(
                        title: Text('Name: ' + ingredients[index].name),
                      ),
                      ListTile(
                          title: Text('Quantity: ' +
                              ingredients[index].quantity.toString()),
                          trailing: const Icon(Icons.mode_edit)),
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
          },
          icon: const Icon(Icons.add),
          label: const Text('add items'),
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
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
/*
              addIngredient() =>
                  AppDatabase.instance.addIngredientInventory(const Ingredient(
                    name: nameOfItem,
                    quantity: quantityOfItem,
                    unit: 'oz',
                    calories: caloriesOfItem,
                    barcode: 145141,
                    
                  ))
              ;*/
            },
            icon: const Icon(Icons.done),
            label: const Text('Done')));
  }
}

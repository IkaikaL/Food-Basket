// ignore_for_file: file_names


import 'package:flutter/material.dart';

// Routes
import 'samplePage.dart';
import 'package:basket/database/recipe.dart';
import 'package:basket/main.dart';

class recipesPageRoute extends StatefulWidget {
  const recipesPageRoute({Key? key}) : super(key: key);

  @override
  _recipesPageRoute createState() => _recipesPageRoute();
}

class _recipesPageRoute extends State<recipesPageRoute> {
  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
      itemCount: recipeList.length, 
      itemBuilder: (context, index) {
      return  Column(
        children: [
          const Image(image: AssetImage('assets/images/Meatballs.jpeg')),
          ExpansionTile(
              title: Text(recipeList[index].name),
              children: [
                ListTile(
                  title: Text('Ingredients: ' + recipeList[index].ingredients),
                  ),
                ListTile(
                  title: Text('Instructions: ' + recipeList[index].instructions),
                  ),
              ],
            ),
        ],
      );
      
          
      }
    ),
    );
  }


}
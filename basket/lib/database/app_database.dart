import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'recipe.dart';
import 'ingredient.dart';
import 'ingredient_property.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();

  //////////////////////////////////
  //UNUSABLE METHODS AND FUNCTIONS//
  //////////////////////////////////

  //database field
  static Database? _database;

  //constructor
  AppDatabase._init();

  //database connection
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('app_database.db');
    return _database!;
  }

  //initialize database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath!, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const realType = 'REAL NOT NULL';

    await db.execute('''
    CREATE TABLE $tableIngredientProperty (
      ${IngredientPropertyFields.id} $idType,
      ${IngredientPropertyFields.name} $textType,
      ${IngredientPropertyFields.calories} $realType,
      ${IngredientPropertyFields.barcode} $integerType
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableIngredients (
      ${IngredientFields.id} $idType,
      ${IngredientFields.name} $textType,
      ${IngredientFields.quantity} $realType,
      ${IngredientFields.unit} $textType,
      ${IngredientFields.calories} $realType,
      ${IngredientFields.barcode} $integerType
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableRecipes (
      ${RecipeFields.id} $idType,
      ${RecipeFields.name} $textType,
      ${RecipeFields.ingredients} $textType,
      ${RecipeFields.instructions} $textType
    )
    ''');
  }

  ////////////////////////////////
  //USABLE METHODS AND FUNCTIONS//
  ////////////////////////////////

  Future<void> deleteDB({String filePath = 'app_database.db'}) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath!, filePath);

    deleteDatabase(path);
  }

  resetTableIngredientProperties() async {
    final db = await instance.database;

    db.delete(tableIngredientProperty);
  }

  resetTableInventory() async {
    final db = await instance.database;

    db.delete(tableIngredients);
  }

  resetTableRecipes() async {
    final db = await instance.database;

    db.delete(tableRecipes);
  }

  Future<IngredientProperty> createIngredientProperty(
      IngredientProperty ingredientProperty) async {
    final db = await instance.database;

    final id =
        await db.insert(tableIngredientProperty, ingredientProperty.toJson());
    return ingredientProperty.copy(id: id);
  }

  Future<IngredientProperty> readIngredientPropertyID(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableIngredientProperty,
      columns: IngredientPropertyFields.values,
      where: '${IngredientPropertyFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return IngredientProperty.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  Future<IngredientProperty> readIngredientPropertyBarcode(int barcode) async {
    final db = await instance.database;

    final maps = await db.query(
      tableIngredientProperty,
      columns: IngredientPropertyFields.values,
      where: '${IngredientPropertyFields.barcode} = ?',
      whereArgs: [barcode],
    );

    if (maps.isNotEmpty) {
      return IngredientProperty.fromJson(maps.first);
    } else {
      throw Exception('BARCODE $barcode is not found');
    }
  }

  Future<List<IngredientProperty>> readAllIngredientProperties() async {
    final db = await instance.database;

    final orderBy = '${IngredientPropertyFields.name} ASC';

    final result = await db.query(tableIngredientProperty, orderBy: orderBy);

    return result.map((json) => IngredientProperty.fromJson(json)).toList();
  }

  Future<int> updateIngredientProperty(
      IngredientProperty ingredientProperty) async {
    final db = await instance.database;

    return db.update(tableIngredientProperty, ingredientProperty.toJson(),
        where: '${IngredientPropertyFields.id} = ?',
        whereArgs: [ingredientProperty.id]);
  }

  Future<int> deleteIngredientProperty(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableIngredientProperty,
      where: '${IngredientPropertyFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<Ingredient> addIngredientInventory(Ingredient ingredient) async {
    final db = await instance.database;

    final id = await db.insert(tableIngredients, ingredient.toJson());
    return ingredient.copy(id: id);
  }

  Future<Ingredient> readInventoryID(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableIngredients,
      columns: IngredientFields.values,
      where: '${IngredientFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Ingredient.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  Future<Ingredient> readInventoryName(String name) async {
    final db = await instance.database;

    final maps = await db.query(
      tableIngredients,
      columns: IngredientFields.values,
      where: '${IngredientFields.name} = ?',
      whereArgs: [name],
    );

    if (maps.isNotEmpty) {
      return Ingredient.fromJson(maps.first);
    } else {
      throw Exception('NAME $name is not found');
    }
  }

  Future<List<Ingredient>> readAllInventory() async {
    final db = await instance.database;

    final orderBy = '${IngredientFields.name} ASC';

    final result = await db.query(tableIngredients, orderBy: orderBy);

    return result.map((json) => Ingredient.fromJson(json)).toList();
  }

  Future<int> updateInventory(Ingredient ingredient) async {
    final db = await instance.database;

    return db.update(tableIngredients, ingredient.toJson(),
        where: '${IngredientFields.id} = ?', whereArgs: [ingredient.id]);
  }

  Future<int> deleteIngredientInventory(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableIngredients,
      where: '${IngredientFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<Recipe> createRecipe(Recipe recipe) async {
    final db = await instance.database;

    final id = await db.insert(tableRecipes, recipe.toJson());
    return recipe.copy(id: id);
  }

  Future<Recipe> readRecipeID(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableRecipes,
      columns: RecipeFields.values,
      where: '${RecipeFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Recipe.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  Future<List<Recipe>> readRecipeName(String name) async {
    final db = await instance.database;

    final result = await db.query(
      tableRecipes,
      columns: RecipeFields.values,
      where: '${RecipeFields.name} LIKE ?',
      whereArgs: [name],
    );

    if (result.isNotEmpty) {
      return result.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('NAME $name is not found');
    }
  }

  Future<List<Recipe>> searchRecipeIngredients(
      List<Ingredient> ingredients) async {
    final db = await instance.database;
    final list = await readAllRecipes();
    var result = <Recipe>[];
    var relevance = [];
    for (final recipe in list) {
      final recipeIngredients = recipe.getIngredients();
      var likes = 0;
      for (final recipeIng in recipeIngredients) {
        var hit = 0;
        for (final i in ingredients) {
          if (recipeIng.toLowerCase().contains(i.name.toLowerCase())) {
            hit = 1;
          }
        }
        if (hit == 1) likes++;
      }
      if (likes > 0) {
        result.add(recipe);
        relevance.add(likes);
      }
    }
    return result;
  }

  Future<List<Recipe>> readAllRecipes() async {
    final db = await instance.database;

    final orderBy = '${RecipeFields.name} ASC';
    final result = await db.query(tableRecipes, orderBy: orderBy);

    return result.map((json) => Recipe.fromJson(json)).toList();
  }

  Future<int> updateRecipe(Recipe recipe) async {
    final db = await instance.database;

    return db.update(tableRecipes, recipe.toJson(),
        where: '${RecipeFields.id} = ?', whereArgs: [recipe.id]);
  }

  Future<int> deleteRecipe(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableRecipes,
      where: '${RecipeFields.id} = ?',
      whereArgs: [id],
    );
  }

  //close connection
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

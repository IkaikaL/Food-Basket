import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'recipe.dart';
import 'ingredient.dart';

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

    await db.execute('''
    CREATE TABLE $tableIngredients (
      ${IngredientFields.id} $idType,
      ${IngredientFields.name} $textType,
      ${IngredientFields.quantity} $integerType,
      ${IngredientFields.unit} $textType
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

  resetTableIngredients() async {
    final db = await instance.database;

    db.delete(tableIngredients);
  }

  resetTableRecipes() async {
    final db = await instance.database;

    db.delete(tableRecipes);
  }

  Future<Ingredient> createIngredient(Ingredient ingredient) async {
    final db = await instance.database;

    final id = await db.insert(tableIngredients, ingredient.toJson());
    return ingredient.copy(id: id);
  }

  Future<Ingredient> readIngredient(int id) async {
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

  Future<List<Ingredient>> readAllIngredients() async {
    final db = await instance.database;

    final orderBy = '${IngredientFields.name} ASC';

    final result = await db.query(tableIngredients, orderBy: orderBy);

    return result.map((json) => Ingredient.fromJson(json)).toList();
  }

  Future<int> updateIngredient(Ingredient ingredient) async {
    final db = await instance.database;

    return db.update(tableIngredients, ingredient.toJson(),
        where: '${IngredientFields.id} = ?', whereArgs: [ingredient.id]);
  }

  Future<int> deleteIngredient(int id) async {
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

  Future<Recipe> readRecipe(int id) async {
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

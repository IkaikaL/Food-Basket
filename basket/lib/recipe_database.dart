import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'recipe.dart';

class RecipeDatabase {
  static final RecipeDatabase instance = RecipeDatabase._init();

  //database field
  static Database? _database;

  //constructor
  RecipeDatabase._init();

  //database connection
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('recipes.db');
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

    await db.execute('''
    CREATE TABLE $tableRecipes (
      ${RecipeFields.id} $idType,
      ${RecipeFields.name} $textType,
      ${RecipeFields.ingredients} $textType,
      ${RecipeFields.instructions} $textType,
    )
    ''');
  }

  Future<Recipe> create(Recipe recipe) async {
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

  Future<int> update(Recipe recipe) async {
    final db = await instance.database;

    return db.update(tableRecipes, recipe.toJson(),
        where: '${RecipeFields.id} = ?', whereArgs: [recipe.id]);
  }

  Future<int> delete(int id) async {
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

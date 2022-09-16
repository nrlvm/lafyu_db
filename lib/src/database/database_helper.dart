// ignore: depend_on_referenced_packages
import 'package:lesson_11/src/model/card_model.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableProductName = 'userTable';
  final String columnProductId = 'id';
  final String columnProductTitle = 'title';
  final String columnProductImage = 'image';
  final String columnProductPrice = 'price';

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'prep_test.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $tableProductName('
      '$columnProductId INTEGER PRIMARY KEY, '
      '$columnProductTitle TEXT, '
      '$columnProductImage TEXT, '
      '$columnProductPrice REAL)',
    );
  }

  /// save product

  Future<int> saveProduct(CardModel data) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableProductName, data.toJson());
    return result;
  }

  ///get all products

  Future<List<CardModel>> getProducts() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableProductName');
    List<CardModel> products = [];
    for (int i = 0; i < list.length; i++) {
      CardModel data = CardModel(
        id: list[i][columnProductId],
        title: list[i][columnProductTitle],
        image: list[i][columnProductImage],
        price: list[i][columnProductPrice],
      );
      products.add(data);
    }
    return products;
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableProductName,
      where: '$columnProductId = ?',
      whereArgs: [id],
    );
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableProductName');
  }
}

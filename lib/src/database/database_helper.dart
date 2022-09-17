// ignore_for_file: depend_on_referenced_packages

import 'package:lesson_11/src/model/favorite_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lesson_11/src/model/card_model.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableProductName = 'userTable';
  final String columnProductId = 'id';
  final String columnProductTitle = 'title';
  final String columnProductImage = 'image';
  final String columnProductPrice = 'price';
  final String columnProductCardCount = 'card_count';

  final String tableFavoriteName = 'favoriteTable';
  final String columnFavoriteId = 'id';
  final String columnFavoriteTitle = 'title';
  final String columnFavoriteImage = 'image';
  final String columnFavoritePrice = 'price';
  final String columnFavoriteStarCount = 'star_count';

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
      '$columnProductCardCount INTEGER, '
      '$columnProductPrice REAL)',
    );
    await db.execute(
      'CREATE TABLE $tableFavoriteName('
      '$columnFavoriteId INTEGER PRIMARY KEY, '
      '$columnFavoriteTitle TEXT, '
      '$columnFavoriteImage TEXT, '
      '$columnFavoriteStarCount REAL, '
      '$columnFavoritePrice REAL)',
    );
  }

  ///save product to favorite
  Future<int> saveFavorite(FavoriteModel data) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableFavoriteName, data.toJson());
    return result;
  }

  /// get all favorites
  Future<List<FavoriteModel>> getFavorites() async {
    var dbClient = await db;
    List<Map> list =
        await dbClient.rawQuery('SELECT * FROM $tableFavoriteName');
    List<FavoriteModel> favorites = [];
    for (int i = 0; i < list.length; i++) {
      FavoriteModel data = FavoriteModel(
        id: list[i][columnFavoriteId],
        starCount: list[i][columnFavoriteStarCount],
        price: list[i][columnFavoritePrice],
        title: list[i][columnFavoriteTitle],
        image: list[i][columnFavoriteImage],
      );
      favorites.add(data);
    }
    return favorites;
  }

  /// delete favorite
  Future<int> deleteFavorite(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableFavoriteName,
      where: '$columnFavoriteId = ?',
      whereArgs: [id],
    );
  }

  /// save product
  Future<int> saveProduct(CartModel data) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableProductName, data.toJson());
    return result;
  }

  ///get all products
  Future<List<CartModel>> getProducts() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableProductName');
    List<CartModel> products = [];
    for (int i = 0; i < list.length; i++) {
      CartModel data = CartModel(
        id: list[i][columnProductId],
        title: list[i][columnProductTitle],
        image: list[i][columnProductImage],
        price: list[i][columnProductPrice],
        cardCount: list[i][columnProductCardCount],
      );
      products.add(data);
    }
    return products;
  }

  Future<List<CartModel>> getProduct(int id) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
      'SELECT * FROM $tableProductName WHERE $columnProductId=$id',
    );
    List<CartModel> products = [];
    for (int i = 0; i < list.length; i++) {
      CartModel data = CartModel(
        id: list[i][columnProductId],
        title: list[i][columnProductTitle],
        image: list[i][columnProductImage],
        price: list[i][columnProductPrice],
        cardCount: list[i][columnProductCardCount],
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

  ///update product
  Future<int> updateProduct(CartModel data) async {
    var dbClient = await db;
    return await dbClient.update(
      tableProductName,
      data.toJson(),
      where: "$columnProductId = ?",
      whereArgs: [data.id],
    );
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableProductName');
  }
}

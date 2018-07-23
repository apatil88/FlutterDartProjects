import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import '../models/item_model.dart';
import 'repository.dart';

class NewsDbProvider implements Source, Cache {
  Database db;

  NewsDbProvider() {
    init();
  }

  //TODO- store and fetch top ids
  Future<List<int>> fetchTopIds() {
    return null;
  }

  void init() async {
    Directory documentsDirectory =
        await getApplicationDocumentsDirectory(); //get a reference to the folder
    final path = join(documentsDirectory.path,
        "items.db"); //get a reference to the path where database is created

    db = await openDatabase(path, version: 1,
        //creates the database when the user open our app the very first time
        onCreate: (Database newDb, int version) {
      newDb.execute("""
            CREATE TABLE ITEMS (
              id INTEGER PRIMARY KEY,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              parent INTEGER,
              kids BLOB,
              dead INTEGER,
              deleted INTEGER,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER
            )
          """);
    });
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db
        .query('Items', columns: null, where: 'id = ?', whereArgs: [id]);

    if (maps.length > 0) {
      return ItemModel.fromDb(
          maps.first); //Convert response from db into ItemModel instance
    }

    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMapForDb());
  }
}

//Create a single instance so that we do not accidentally open multiple db connections to the same database
final newsDbProvider = NewsDbProvider();

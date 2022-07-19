import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Verb {
  String infinitive;
  String past;
  String participle;
  String translation;

  Verb(this.infinitive, this.past, this.participle, this.translation);
}

class DatabaseHelper {
  static const table = 'verbs';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "verbs.sqlite");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "verbs.sqlite"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    return await openDatabase(path, readOnly: true);
  }

  Future<List<Verb>> queryAllRows() async {
    Database db = await instance.database;
    var result = <Verb>[];
    var rows = await db.query(table);
    for (var element in rows) {
      result.add(Verb(element['infinitive'], element['past'],
          element["participle"], element["translation"]));
    }
    return result;
  }
}

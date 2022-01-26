// @dart=2.9

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:task_api/model/loading_model.dart';
import "package:path/path.dart";

class DatabaseHelper {
  static DatabaseHelper databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String surahTable = 'surah_table';
  String colId = 'id';
  String colname = 'name';
  String colenglishname = 'englishname';
  String colenglishNameTranslation = 'englishNameTranslation';
  String colnumberOfAyahs = "numberOfAyahs";

  String ayatTable = 'ayat_table';
  String coltext = 'text';
  String colisFavourite = 'isFavourite';
  String colsurahId = 'surahId';
  String coltranslation = 'translation';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper
  factory DatabaseHelper() {
    if (databaseHelper == null) {
      databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "quran.db");

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
      ByteData data = await rootBundle.load(join("assets", "quran.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    return await openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> getMapList(String table) async {
    Database db = await this.database;
    var result = await db.query(table);
    return result;
  }

  Future<int> insertSurah(SurahModel surah) async {
    Database db = await this.database;
    var result = await db.insert(surahTable, surah.toMap());
    return result;
  }

  Future<int> insertAyaat(AyaatModel ayaat) async {
    Database db = await this.database;
    var result = await db.insert(ayatTable, ayaat.toMap());
    return result;
  }

  Future<List<SurahModel>> getSurah() async {
    var noteMapList =
        await getMapList(surahTable); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table
    List<SurahModel> noteList = [];
    for (int i = 0; i < count; i++) {
      noteList.add(SurahModel.fromMapObject(noteMapList[i]));
    }
    return noteList;
  }

  Future<List<AyaatModel>> getSurahAyat(int surahId) async {
    Database database = await this.database;
    var mapList = await database
        .query(ayatTable, where: "$colsurahId = ?", whereArgs: [surahId]);
    int count = mapList.length; // Count the number of map entries in db table
    List<AyaatModel> noteList = [];
    for (int i = 0; i < count; i++) {
      noteList.add(AyaatModel.fromMapObject(mapList[i]));
    }
    return noteList;
  }

  Future<int> getAyatTranslation(String text, int id) async {
    Database database = await this.database;
    var mapList = await database.rawUpdate(
        'UPDATE $ayatTable SET $coltranslation = ? WHERE $colId = ?',
        [text, id]);
    return mapList;
  }

  Future<AyaatModel> updateMark(AyaatModel ayaatModel) async {
    var db = await this.database;
    var result = await db.rawUpdate(
        'UPDATE $ayatTable  SET $colisFavourite =?  WHERE $colId = ?',
        [ayaatModel.isFavourite, ayaatModel.id]);
    print(result);
    return ayaatModel;
  }

  Future<List<AyaatModel>> getbookMark() async {
    Database database = await this.database;
    var mapList = await database
        .query(ayatTable, where: "$colisFavourite = ?", whereArgs: [1]);
    int count = mapList.length; // Count the number of map entries in db table
    List<AyaatModel> noteList = [];
    for (int i = 0; i < count; i++) {
      noteList.add(AyaatModel.fromMapObject(mapList[i]));
    }
    return noteList;
  }

  Future<List<SurahModel>> getSurahName(String englishname) async {
    Database database = await this.database;
    var mapList = await database.rawQuery(
        "SELECT * FROM $surahTable WHERE $colenglishname LIKE '%$englishname%'");
    int count = mapList.length; // Count the number of map entries in db table
    List<SurahModel> noteList = [];
    for (int i = 0; i < count; i++) {
      noteList.add(SurahModel.fromMapObject(mapList[i]));
    }
    return noteList;
  }


  Future<List<AyaatModel>> getSurahAyatData(String translation, int surahId) async {
    Database database = await this.database;
    var mapList = await database.rawQuery(
        "SELECT * FROM $ayatTable WHERE $coltranslation LIKE '%$translation%' AND $colsurahId = $surahId;");
    int count = mapList.length; // Count the number of map entries in db table
    List<AyaatModel> noteList = [];
    for (int i = 0; i < count; i++) {
      noteList.add(AyaatModel.fromMapObject(mapList[i]));
    }
    return noteList;
  }


}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Internal_Database_Manager {
  final String tableName = 'myTrophies';
  final String dbName = 'myTrophies.db';
  final String gameNameColumn = 'GameName';
  final String achivedTrophyListColumn = 'TrophyList';
  final String totalTrophyColumn = 'TotalTrophy';
  final String noOfAchievedTrophyColumn = 'NoOfAchievedTrophy';
  static Database _db;

  Future<Database> get db async {
    print("Entered get db");
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    print('Entered init db');
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void deleteDB() async {
    print('Entered deleteDatabase');
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    await deleteDatabase(path);
  }

  void _onCreate(Database db, int newVersion) async {
    print('Entered onCreate db');
    await db.execute(
        'CREATE TABLE $tableName($gameNameColumn TEXT PRIMARY KEY, $achivedTrophyListColumn TEXT, $noOfAchievedTrophyColumn INTEGER, $totalTrophyColumn INTEGER)');
  }

  void addGameToDb(String gameName, List<bool> trophyList,
      int noOfAchievedTrophies, int totalNumberOfTrophies) async {
    var dbClient = await db; //This calls the getter function
    String encodedTrophyList = await listEncoder(trophyList);
    var result = await dbClient.rawInsert(
        'INSERT INTO $tableName($gameNameColumn, $achivedTrophyListColumn, $noOfAchievedTrophyColumn,$totalTrophyColumn) '
        'VALUES("$gameName","$encodedTrophyList","$noOfAchievedTrophies","$totalNumberOfTrophies")');
    print(result);
  }

  Future<List<bool>> listDecoder(String encoded) async {
    List<bool> decoded = [];
    for (String x in encoded.split('|')) {
      if (x == 'true') {
        decoded.add(true);
      } else {
        decoded.add(false);
      }
    }
    return decoded;
  }

  Future<String> listEncoder(List<bool> trophiesList) async {
    String encoded = "";
    int len = trophiesList.length;
    for (int i = 0; i < len - 1; i++) {
      if (trophiesList[i]) {
        encoded += 'true|';
      } else {
        encoded += 'false|';
      }
    }
    if (trophiesList[len - 1]) {
      encoded += 'true';
    } else {
      encoded += 'false';
    }

    return encoded;
  }
}

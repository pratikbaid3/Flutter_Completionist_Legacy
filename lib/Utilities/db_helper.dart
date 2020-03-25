import 'dart:io';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Database_Manager {
  Database db;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  void Transfer_Data() async {
    String dirPath = await _localPath;
    String path = join(dirPath, "asset_trophiesDataLink.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      //Load database from asset and copy
      print("Creating new copy of the DB");
      ByteData data =
          await rootBundle.load(join('assets', 'trophiesDataLink.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      //Save copied asset to documents
      await new File(path).writeAsBytes(bytes);
    } else {
      print("Opening existing DB");
    }
  }

  Future<List<List<String>>> getGameName() async {
    List<String> gameName = new List<String>();
    List<String> gameIcon = new List<String>();

    List<List<String>> gameData = new List();

    String dirPath = await _localPath;
    String path = join(dirPath, "asset_trophiesDataLink.db");
    db = await openDatabase(path, readOnly: true);
    String TABLE = 'trophy_data_link';
    String COLUMN = 'game_name';
    List<Map> list = await db.rawQuery('SELECT * FROM $TABLE');
    if (list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        gameName.add(list[i]['game_name']);
        String gameIconLink =
            "https://www.playstationtrophies.org" + list[i]['image_link'];
        gameIcon.add(gameIconLink);
      }
      gameData.add(gameName);
      gameData.add(gameIcon);
      return gameData;
    }
  }
}

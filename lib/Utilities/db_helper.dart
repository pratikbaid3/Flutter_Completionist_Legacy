import 'dart:io';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Database_Manager {
  var db;

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
    db = await openDatabase(path, readOnly: true);
  }
}

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:poke_app/models/userModel.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static late Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documntDirectory = await getApplicationDocumentsDirectory();
    String path = join(documntDirectory.path, "data_poke.db");

    ByteData data = await rootBundle.load(join('data', 'poke.db'));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await new File(path).writeAsBytes((bytes));

    var dBase = await openDatabase(path);
    return dBase;
  }

}
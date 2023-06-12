import 'dart:io';
import 'dart:math';
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

  static Database? _db;

  Future<Database?> get db async {
  if (_db != null) {
    print("db not null");
    return _db;
  }
  print("db null");
  _db = await initDb();
  DatabaseHelper con = new DatabaseHelper();
    var dbClient = await con.db;
    if (dbClient != null) {
      await dbClient.execute('''
        CREATE TABLE pokemon(
          uid TEXT,
          id TEXT,
          name TEXT,
          image TEXT
        )
      ''');
      
      // UserModel user = new UserModel("toavina", "toavina");
      // await dbClient.insert("User", user.fro());
    }
  return _db;
}

  DatabaseHelper.internal();

  initDb() async {
    Directory documntDirectory = await getApplicationDocumentsDirectory();
    String path = join(documntDirectory.path, "data_poke.db");

    // if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){  
    //   // Load database from asset and copy  
      ByteData data = await rootBundle.load(join('data', 'poke.db'));  
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);  
  
    //   // Save copied asset to documents  
      await new File(path).writeAsBytes(bytes);  
    // } 

    

    var dBase = await openDatabase(path);
    
    return dBase;
  }

}
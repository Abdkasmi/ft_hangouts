import 'header.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:ffi';

class Database {

  static Database? _database;

  // Future<Database> get initDatabase() async {
  //   final getDirectory = await getApplicationDocumentsDirectory();
  //   String path = getDirectory.path + '/contacts.db';
  //   log(path);
  //   return await openDatabase(path, onCreate: _onCreate, version: 1); 
  // }

  // Future<Database> get database async {
  //   if (_database != null) return _database!;
  //   _database = await initDatabase();
  //   return _database!;
  // }



}
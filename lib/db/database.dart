import '../header.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('contacts.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstName TEXT NOT NULL,
        lastName TEXT NOT NULL,
        phoneNumber TEXT NOT NULL,
        email TEXT NOT NULL,
        pseudo TEXT NOT NULL
      )
    ''');
  }

  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE contacts_new (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          firstName TEXT NOT NULL,
          lastName TEXT NOT NULL,
          phoneNumber TEXT NOT NULL,
          email TEXT NOT NULL,
          nickname TEXT NOT NULL
        )
      ''');

      await db.execute('''
        INSERT INTO contacts_new (id, firstName, lastName, phoneNumber, email, nickname)
        SELECT id, firstName, lastName, phoneNumber, email, pseudo
        FROM contacts
      ''');

      await db.execute('DROP TABLE contacts');

      await db.execute('ALTER TABLE contacts_new RENAME TO contacts');
    }
  }

  Future<int> createContact(Contact contact) async {
    final db = await instance.database;
    return await db.insert('contacts', contact.toMap());
  }

  Future<List<Contact>> readAllContacts() async {
    final db = await instance.database;
    final result = await db.query('contacts');
    return result.map((map) => Contact.fromMap(map)).toList();
  }

  Future<int> updateContact(Contact contact) async {
    final db = await instance.database;
    return await db.update(
      'contacts',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> deleteContact(int id) async {
    final db = await instance.database;
    return await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await _database;
    if (db != null) await db.close();
  }
}

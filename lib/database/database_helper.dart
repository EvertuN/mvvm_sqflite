import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/pessoaModel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'pessoas.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pessoas(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertPessoa(Pessoa pessoa) async {
    final db = await database;
    await db.insert('pessoas', pessoa.toMap());
  }

  Future<List<Pessoa>> getPessoas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pessoas');

    return List.generate(maps.length, (i) {
      return Pessoa.fromMap(maps[i]);
    });
  }
  Future<void> updatePessoa(Pessoa pessoa) async {
    final db = await database;
    await db.update(
      'pessoas',
      pessoa.toMap(),
      where: 'id = ?',
      whereArgs: [pessoa.id],
    );
  }

  Future<void> deletePessoa(int id) async {
    final db = await database;
    await db.delete(
      'pessoas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

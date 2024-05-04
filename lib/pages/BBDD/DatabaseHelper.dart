import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'usuario_class.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'escuelapp.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE registro (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT,
        pass TEXT,
        codigo TEXT
      )
    ''');

    // Insertar algunos usuarios de ejemplo
    await db.insert('registro', {
      'email': 'docente@example.com',
      'pass': '123456',
      'codigo': 'docente',
    });

    await db.insert('registro', {
      'email': 'padre@example.com',
      'pass': 'abcdef',
      'codigo': 'padre',
    });
  }

  Future<String> obtenerEmailUsuario() async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query('registro');
    if (results.isNotEmpty) {
      return results.first['email'];
    }
    return ''; // O cualquier otro valor predeterminado
  }

  Future<Usuario?> buscarUsuario(String email, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query('registro', where: 'email = ? AND pass = ?', whereArgs: [email, password]);
    if (results.isNotEmpty) {
      Map<String, dynamic> userMap = results.first;
      return Usuario(userMap['email'], userMap['pass'], userMap['codigo']);
    }
    return null;
  }

  Future<int> insertRegistro(Map<String, dynamic> registro) async {
    try {
      Database db = await database;
      return await db.insert('registro', registro);
    } catch (e) {
      print('Error al insertar registro: $e');
      return -1; // O cualquier otro valor que indique un error
    }
  }
}

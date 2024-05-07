import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseAlumnos {
  static Database? _database;
  static const String dbName = 'mi_base_de_datos.db';
  static const String alumnosTable = 'alumnos';
  static const String colId = 'id';
  static const String colNombre = 'nombre';
  static const String colApellidos = 'apellidos';
  static const String colEmailPadre = 'email_padre';
  static const String colEmailMadre = 'email_madre';
  static const String colCurso = 'curso';
  static const String colFoto = 'foto';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $alumnosTable (
            $colId INTEGER PRIMARY KEY AUTOINCREMENT,
            $colNombre TEXT,
            $colApellidos TEXT,
            $colEmailPadre TEXT,
            $colEmailMadre TEXT,
            $colCurso TEXT,
            $colFoto TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertAlumno(Map<String, dynamic> alumno) async {
    final Database db = await database;
    return await db.insert(alumnosTable, alumno);
  }

  Future<List<Map<String, dynamic>>> getAllAlumnos() async {
    final Database db = await database;
    return await db.query(alumnosTable);
  }

  Future<List<Map<String, dynamic>>> getAlumnosByCurso(String curso) async {
    final Database db = await database;
    // Utilizamos un patrón de consulta que permita encontrar coincidencias parciales
    return await db.query(alumnosTable, where: '$colCurso LIKE ?', whereArgs: ['%$curso%']);
  }

}

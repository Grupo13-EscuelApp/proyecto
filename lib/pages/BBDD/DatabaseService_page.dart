import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart'; // Importa la implementación de Sembast para IO
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'usuario_class.dart';

abstract class DatabaseService {
  Future<int> insertRegistro(Map<String, dynamic> registro);
  Future<Usuario?> buscarUsuario(String email, String password);
}

class SembastDatabaseService implements DatabaseService {
  static final SembastDatabaseService _instance = SembastDatabaseService._();
  static Database? _database;

  SembastDatabaseService._();

  factory SembastDatabaseService() => _instance;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'escuelapp.db');
    final database = await databaseFactoryIo.openDatabase(dbPath);
    return database;
  }

  @override
  Future<int> insertRegistro(Map<String, dynamic> registro) async {
    try {
      final db = await database;
      final store = intMapStoreFactory.store('registro');
      return await store.add(db, registro);
    } catch (e) {
      print('Error al insertar registro: $e');
      return -1; // O cualquier otro valor que indique un error
    }
  }

  @override
  Future<Usuario?> buscarUsuario(String email, String password) async {
    try {
      final db = await database;
      final store = intMapStoreFactory.store('registro');
      final finder = Finder(filter: Filter.and([
        Filter.equals('email', email),
        Filter.equals('pass', password),
      ]));
      final recordSnapshots = await store.find(db, finder: finder);
      if (recordSnapshots.isNotEmpty) {
        final record = recordSnapshots.first;
        return Usuario(
          record['email'] as String,
          record['pass'] as String,
          record['codigo'] as String,
        );
      }
      return null;
    } catch (e) {
      print('Error al buscar usuario: $e');
      return null;
    }
  }

}

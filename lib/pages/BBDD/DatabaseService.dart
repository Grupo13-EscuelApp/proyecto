import 'package:proyecto_inicio/pages/BBDD/DatabaseHelper.dart';
import 'package:proyecto_inicio/pages/BBDD/DatabaseService_page.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';

class DatabaseHelperService implements DatabaseService {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Future<int> insertRegistro(Map<String, dynamic> registro) async {
    return await _databaseHelper.insertRegistro(registro);
  }

  @override
  Future<Usuario?> buscarUsuario(String email, String password) async {
    return await _databaseHelper.buscarUsuario(email, password);
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';

void main() {
  test('Usuario Constructor Test', () {
    // Arrange
    final String email = 'example@example.com';
    final String password = 'password';
    final String tipo = 'docente';

    // Act
    final usuario = Usuario(email, password, tipo);

    // Assert
    expect(usuario.email, email);
    expect(usuario.password, password);
    expect(usuario.tipo, tipo);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';

void main() {
  testWidgets('InformacionPage UI Test', (WidgetTester tester) async {
    // Construir el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: Informacion(
        Usuario("test@test.com", "Test", "User"),
      ),
    ));

    // Verificar que el título se muestra correctamente
    expect(find.text('Informacion Centro'), findsOneWidget);

    // Verificar que el nombre del centro se muestra correctamente
    expect(find.text('Nombre del centro'), findsOneWidget);

    // Verificar que el teléfono se muestra correctamente
    expect(find.text('Telefono'), findsOneWidget);

    // Verificar que el email se muestra correctamente
    expect(find.text('Email'), findsOneWidget);

    // Verificar que la dirección se muestra correctamente
    expect(find.text('Direccion'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/docente/menu_docente_alumno_page.dart';


void main() {
  testWidgets('MenuDocentes UI Test', (WidgetTester tester) async {
    // Construir el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: MenuDocentes(
        nombreAlumno: 'Test',
        apellidoAlumno: 'User',
        fotoUrlAlumno: 'https://via.placeholder.com/108x105',
        usuario: Usuario("test@test.com", "Test", "User"),
      ),
    ));

    // Verificar que el título se muestra correctamente
    expect(find.text('Test User'), findsOneWidget);

    // Verificar que los elementos del menú se muestran correctamente
    expect(find.text('Alimentación'), findsOneWidget);
    expect(find.text('Deposiciones'), findsOneWidget);
    expect(find.text('Descanso'), findsOneWidget);
    expect(find.text('Reponer'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);

    // Simular tocar un elemento del menú
    await tester.tap(find.text('Deposiciones'));
    await tester.pumpAndSettle();

    // Verificar si la navegación a la página correspondiente se realiza correctamente
    expect(find.text('Deposiciones del alumno'), findsOneWidget);
    expect(find.text('Nombre del alumno: Test User'), findsOneWidget);
    expect(find.text('Atrás'), findsOneWidget);
  });
}

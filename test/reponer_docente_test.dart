import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/docente/reponer_docente_page.dart';


void main() {
  testWidgets('ReponerDoc UI Test', (WidgetTester tester) async {
    // Construye el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: ReponerDoc(
        Usuario("", "", ""),
        nombreAlumno: 'Nombre',
        apellidoAlumno: 'Apellido',
        fotoUrlAlumno: 'https://via.placeholder.com/108x105',
      ),
    ));

    // Verifica si el título se muestra correctamente
    expect(find.text('Nombre Apellido'), findsOneWidget);

    // Verifica si el botón de añadir se muestra correctamente
    expect(find.text('Añadir'), findsOneWidget);

    // Simula el tap en el botón de añadir
    await tester.tap(find.text('Añadir'));
    await tester.pumpAndSettle(); // Espera a que aparezca el diálogo

    // Verifica si el diálogo de añadir se muestra correctamente
    expect(find.text('Añadir Tarea'), findsOneWidget);

    // Simula la entrada de datos en el diálogo de añadir
    await tester.enterText(find.byType(TextField), 'Hacer ejercicio');

    // Simula el tap en el botón de guardar del diálogo de añadir
    await tester.tap(find.text('Guardar'));
    await tester.pumpAndSettle(); // Espera a que se cierre el diálogo

    // Verifica si la tarea añadida se muestra correctamente
    expect(find.text('Hacer ejercicio'), findsOneWidget);
  });
}

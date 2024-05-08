import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/docente/inicio_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/p1_docente_page.dart';
import 'package:proyecto_inicio/pages/añadir/addUserDoc_page.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';

void main() {
  testWidgets('P1_Docente UI Test', (WidgetTester tester) async {
    // Construye el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: P1_Docente(Usuario("", "", "")),
    ));

    // Verifica si el título se muestra correctamente
    expect(find.text('Curso P1'), findsOneWidget);

    // Verifica si el botón de añadir se muestra correctamente
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Simula el tap en el botón de añadir
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); // Espera a que aparezca la siguiente pantalla

    // Verifica si la pantalla de añadir usuario se muestra correctamente
    expect(find.byType(AddUserDoc), findsOneWidget);

    // Simula el tap en el botón de atrás
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle(); // Espera a que aparezca la pantalla anterior

    // Verifica si la pantalla de inicio docente se muestra correctamente después de volver atrás
    expect(find.byType(InicioDocente), findsOneWidget);

    // Verifica si los alumnos se muestran correctamente
    expect(find.byType(Alumno), findsNWidgets(4));
  });

  testWidgets('Alumno UI Test', (WidgetTester tester) async {
    // Construye el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: Alumno(
        nombre: 'Nombre',
        apellido: 'Apellido',
        clase: 'Clase',
        fotoUrl: 'https://via.placeholder.com/200x200',
        usuario: Usuario("", "", ""),
      ),
    ));

    // Verifica si el nombre, apellido y clase se muestran correctamente
    expect(find.text('Nombre'), findsOneWidget);
    expect(find.text('Apellido'), findsOneWidget);
    expect(find.text('Clase'), findsOneWidget);

    // Verifica si la imagen del alumno se muestra correctamente
    expect(find.byType(GestureDetector), findsOneWidget);
  });
}

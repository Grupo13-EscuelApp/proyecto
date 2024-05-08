import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUsuPadre_page.dart';
import 'package:proyecto_inicio/pages/inicio_alumno_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/menu_alumno_padres_page.dart';

void main() {
  testWidgets('InicioAlumno widget test', (WidgetTester tester) async {
    // Construye el widget y espera a que esté completamente renderizado
    await tester.pumpWidget(MaterialApp(home: InicioAlumno(Usuario("", "", ""))));

    // Verifica si se muestra correctamente el título de la AppBar
    expect(find.text('EscuelApp'), findsOneWidget);

    // Verifica si se encuentra el icono del menú en la AppBar
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Verifica si se encuentra el icono de agregar usuario en la AppBar
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Verifica si se encuentra el Drawer
    expect(find.byType(Drawer), findsOneWidget);

    // Simula el tap en el botón de agregar usuario
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la página de agregar usuario
    expect(find.byType(AddUserPadre), findsOneWidget);

    // Verifica si se encuentra el ListView de alumnos
    expect(find.byType(ListView), findsOneWidget);

    // Simula el tap en un alumno
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la página de menú de padres
    expect(find.byType(MenuPadres), findsOneWidget);

    // Agrega más pruebas según sea necesario
  });
}

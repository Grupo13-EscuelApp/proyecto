import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUsuPadre_page.dart';


void main() {
  testWidgets('AddUserPadre Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: AddUserPadre(Usuario("", "", "")),
    ));

    // Verify that the title is displayed.
    expect(find.text('Añadir Usuario'), findsOneWidget);

    // Verify that the menu drawer is displayed.
    expect(find.byType(Drawer), findsOneWidget);

    // Verify that the "Eventos" option is displayed.
    expect(find.text('Eventos'), findsOneWidget);

    // Verify that the "Información" option is displayed.
    expect(find.text('Información'), findsOneWidget);

    // Verify that the "Ajustes" option is displayed.
    expect(find.text('Ajustes'), findsOneWidget);

    // Verify that the "Salir" option is displayed.
    expect(find.text('Salir'), findsOneWidget);

    // Verify that the message for professional access is displayed.
    expect(
        find.text('Acceso solo para profesional docente'), findsOneWidget);
  });
}

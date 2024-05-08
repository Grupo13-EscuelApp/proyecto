import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUserDoc_page.dart';


void main() {
  testWidgets('AddUserDoc Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: AddUserDoc(Usuario("", "", "")),
    ));

    // Verify that the title is displayed.
    expect(find.text('Añadir Usuario'), findsOneWidget);

    // Verify that the input fields are displayed.
    expect(find.byType(TextField), findsNWidgets(4));

    // Verify that the dropdown button is displayed.
    expect(find.byType(DropdownButton), findsOneWidget);

    // Verify that the image placeholder is displayed.
    expect(find.byType(GestureDetector), findsOneWidget);

    // Verify that the "Añadir" button is displayed.
    expect(find.text('Añadir'), findsOneWidget);
  });
}

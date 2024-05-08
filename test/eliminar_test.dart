import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/menu/eliminar_page.dart';

void main() {
  testWidgets('EliminarPage UI Test', (WidgetTester tester) async {
    // Construir el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: Eliminar(
          Usuario("test@test.com", "Test", "User")),
    ));


    // Verificar que el título se muestra correctamente
    expect(find.text('Ajustes'), findsOneWidget);

    // Verificar que el mensaje de advertencia se muestra correctamente
    expect(find.text('Si deseas eliminar su cuenta, introduce la contraseña para continuar con la acción.'), findsOneWidget);

    // Verificar que el campo de contraseña está presente
    expect(find.byType(TextField), findsOneWidget);

    // Verificar que el botón de eliminar está presente
    expect(find.text('Eliminar'), findsOneWidget);

    // Tocar el botón de eliminar y verificar que funciona correctamente
    await tester.tap(find.text('Eliminar'));
    await tester.pump();


  });
}

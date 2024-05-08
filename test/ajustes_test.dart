import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';

void main() {
  testWidgets('AjustesPage UI Test', (WidgetTester tester) async {
    // Construir el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: AjustesPage(usuario: Usuario("test@test.com", "Test", "User")),
    ));

    // Verificar que el título se muestra correctamente
    expect(find.text('Ajustes'), findsOneWidget);

    // Verificar que el switch de notificaciones está apagado inicialmente
    expect(find.byType(Switch), findsOneWidget);
    expect(tester.widget<Switch>(find.byType(Switch)).value, false);

    // Tocar el switch de notificaciones y verificar que cambia su valor
    await tester.tap(find.byType(Switch));
    await tester.pump();
    expect(tester.widget<Switch>(find.byType(Switch)).value, true);

    // Verificar que los botones están presentes
    expect(find.text('Guardar'), findsOneWidget);
    expect(find.byIcon(Icons.delete), findsOneWidget);
  });
}

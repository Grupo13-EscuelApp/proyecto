import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/docente/inicio_docente_page.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';


void main() {
  testWidgets('InicioDocente UI Test', (WidgetTester tester) async {
    // Construir el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: InicioDocente(
        Usuario("test@test.com", "Test", "User"),
      ),
    ));

    // Verificar que el título se muestra correctamente
    expect(find.text('EscuelApp'), findsOneWidget);

    // Verificar que los elementos del menú se muestran correctamente
    expect(find.text('Eventos'), findsOneWidget);
    expect(find.text('Información'), findsOneWidget);
    expect(find.text('Ajustes'), findsOneWidget);
    expect(find.text('Salir'), findsOneWidget);

    // Verificar que los botones de selección de clase se muestran correctamente
    expect(find.text('P0'), findsOneWidget);
    expect(find.text('P1'), findsOneWidget);
    expect(find.text('P2'), findsOneWidget);
    expect(find.text('Ir a Chat'), findsOneWidget);

    // Simular tocar un botón de selección de clase
    await tester.tap(find.text('P0'));
    await tester.pumpAndSettle();

    // Verificar si la navegación a la página P0 se realiza correctamente
    expect(find.text('Página P0'), findsOneWidget);
    expect(find.text('Ir a Chat'), findsOneWidget);

    // Simular tocar el botón "Ir a Chat"
    await tester.tap(find.text('Ir a Chat'));
    await tester.pumpAndSettle();

    // Verificar si la navegación al chat se realiza correctamente
    expect(find.text('Seleccionar Grupo de Chat'), findsOneWidget);
  });
}

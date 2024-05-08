import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/registro_page.dart';


void main() {
  testWidgets('Registro Widget Test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Registro()));

    // Verifica que el widget de Registro se haya construido correctamente
    expect(find.text('EscuelApp'), findsOneWidget);
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('Contraseña'), findsOneWidget);
    expect(find.text('Código'), findsOneWidget);

    // Simula el llenado de los campos de texto
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'testpassword');
    await tester.enterText(find.byType(TextField).at(2), '123456');

    // Simula el tap en el botón de registro
    await tester.tap(find.text('Registrar'));
    await tester.pump(); // Espera a que se complete la acción de tap

    // Verifica que se haya mostrado el Toast de registro exitoso
    expect(find.text('Registro insertado correctamente'), findsOneWidget);
  });
}

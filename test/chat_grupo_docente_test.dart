import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/docente/chat/chat_selec_doc_page.dart';

void main() {
  testWidgets('ChatDocGrupal UI Test', (WidgetTester tester) async {
    // Construye el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: ChatDocGrupal(),
    ));

    // Verifica si el appbar se muestra correctamente
    expect(find.text('EscuelApp'), findsOneWidget);

    // Verifica si el botón de retroceso se muestra correctamente
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    // Verifica si los botones de cámara y adjuntar se muestran correctamente
    expect(find.byIcon(Icons.camera), findsOneWidget);
    expect(find.byIcon(Icons.attach_file), findsOneWidget);

    // Verifica si el campo de texto para escribir un mensaje se muestra correctamente
    expect(find.byType(TextField), findsOneWidget);

    // Verifica si el botón de enviar se muestra correctamente
    expect(find.byIcon(Icons.send), findsOneWidget);

    // Simula el tap en el botón de enviar
    await tester.tap(find.byIcon(Icons.send));
    await tester.pumpAndSettle(); // Espera a que se ejecute la acción

    // Verifica que el mensaje no se envíe si no hay texto ni imagen
    expect(find.byType(Image), findsNothing);

    // Simula el tap en el botón de cámara
    await tester.tap(find.byIcon(Icons.camera));
    await tester.pumpAndSettle(); // Espera a que se ejecute la acción

    // Verifica si el diálogo de confirmación se muestra correctamente después de seleccionar una imagen
    expect(find.text('Confirmar envío'), findsOneWidget);

    // Simula el tap en el botón "Cancelar" del diálogo de confirmación
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle(); // Espera a que se ejecute la acción

    // Verifica si el diálogo de confirmación se cierra después de cancelar
    expect(find.text('Confirmar envío'), findsNothing);

    // Simula el tap en el botón de cámara nuevamente
    await tester.tap(find.byIcon(Icons.camera));
    await tester.pumpAndSettle(); // Espera a que se ejecute la acción

    // Simula el tap en el botón "Enviar" del diálogo de confirmación
    await tester.tap(find.text('Enviar'));
    await tester.pumpAndSettle(); // Espera a que se ejecute la acción

    // Verifica si se muestra la imagen enviada
    expect(find.byType(Image), findsOneWidget);
  });
}

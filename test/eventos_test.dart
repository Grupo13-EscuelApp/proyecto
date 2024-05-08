import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';

void main() {
  testWidgets('EventosPage UI Test', (WidgetTester tester) async {
    // Construir el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: Eventos(
        Usuario("test@test.com", "Test", "User"),
      ),
    ));

    // Verificar que el título se muestra correctamente
    expect(find.text('Eventos'), findsOneWidget);

    // Verificar que el texto inicial del día seleccionado se muestra correctamente
    expect(find.text(DateFormat('dd/MM/yyyy').format(DateTime.now())), findsOneWidget);

    // Verificar que el botón para agregar evento se muestra correctamente
    expect(find.text('+ Agregar Evento'), findsOneWidget);

    // Tocar el botón para agregar evento
    await tester.tap(find.text('+ Agregar Evento'));
    await tester.pump();

    // Verificar que se abre el diálogo para agregar evento
    expect(find.text('Ingrese el evento'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Aceptar'), findsOneWidget);
    expect(find.text('Cancelar'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/docente/alimentacion_docente_page.dart';


void main() {
  testWidgets('ComidaDocente UI Test', (WidgetTester tester) async {
    // Construye el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: ComidaDocente(
        Usuario("", "", ""),
        nombreAlumno: 'Nombre',
        apellidoAlumno: 'Apellido',
        fotoUrlAlumno: 'https://via.placeholder.com/108x105',
      ),
    ));

    // Verifica si el título se muestra correctamente
    expect(find.text('Nombre Apellido'), findsOneWidget);

    // Verifica si los elementos del menú se muestran correctamente
    expect(find.text('Eventos'), findsOneWidget);
    expect(find.text('Información'), findsOneWidget);
    expect(find.text('Ajustes'), findsOneWidget);
    expect(find.text('Salir'), findsOneWidget);

    // Verifica si las comidas se muestran correctamente
    expect(find.text('Desayuno'), findsOneWidget);
    expect(find.text('Primero'), findsOneWidget);
    expect(find.text('Segundo'), findsOneWidget);
    expect(find.text('Postre'), findsOneWidget);
    expect(find.text('Merienda'), findsOneWidget);

    // Realiza una interacción: Cambia el estado de la comida "Desayuno" a "Nada"
    await tester.tap(find.widgetWithText(DropdownButton, 'Todo')); // Toca el botón de desplegar el menú
    await tester.pumpAndSettle(); // Espera a que aparezcan los elementos del menú
    await tester.tap(find.text('Nada')); // Selecciona "Nada"
    await tester.pumpAndSettle(); // Espera a que se actualice la interfaz de usuario

    // Verifica si el estado de la comida "Desayuno" se ha actualizado correctamente
    expect(find.text('Desayuno'), findsOneWidget);
    expect(find.text('Nada'), findsOneWidget);
  });
}

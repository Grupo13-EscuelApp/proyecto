import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/docente/chat_alumno_docente_page.dart';


void main() {
  testWidgets('ChatDoc UI Test', (WidgetTester tester) async {
    // Construye el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: ChatDoc(
        Usuario("", "", ""),
        nombreAlumno: 'Nombre',
        apellidoAlumno: 'Apellido',
        fotoUrlAlumno: 'https://via.placeholder.com/108x105',
      ),
    ));

    // Verifica si el título se muestra correctamente
    expect(find.text('Nombre Apellido'), findsOneWidget);

    // Verifica si los elementos del menú se muestran correctamente
    expect(find.byIcon(Icons.camera), findsOneWidget);
    expect(find.byIcon(Icons.attach_file), findsOneWidget);
    expect(find.byIcon(Icons.send), findsOneWidget);

    // Simula el envío de un mensaje de texto
    await tester.enterText(find.byType(TextField), '¡Hola!');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump(); // Espera a que se actualice la interfaz de usuario

    // Verifica si el mensaje de texto se muestra correctamente
    expect(find.text('¡Hola!'), findsOneWidget);

    // Simula la selección de una imagen de la galería
    await tester.tap(find.byIcon(Icons.attach_file));
    await tester.pumpAndSettle(); // Espera a que aparezcan los elementos del menú
    await tester.tap(find.text('Galería'));
    await tester.pump(); // Espera a que se actualice la interfaz de usuario

    // Verifica si la imagen seleccionada se muestra correctamente
    expect(find.byType(Image), findsOneWidget);

    // Simula la selección de una imagen desde la cámara
    await tester.tap(find.byIcon(Icons.attach_file));
    await tester.pumpAndSettle(); // Espera a que aparezcan los elementos del menú
    await tester.tap(find.text('Cámara'));
    await tester.pump(); // Espera a que se actualice la interfaz de usuario

    // Verifica si la imagen seleccionada se muestra correctamente
    expect(find.byType(Image), findsOneWidget);
  });
}

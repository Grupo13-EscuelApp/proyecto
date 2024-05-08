import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';
import 'package:proyecto_inicio/pages/padres/chat_padres_page.dart';

void main() {
  testWidgets('ChatPadres widget test', (WidgetTester tester) async {
    // Construye el widget y espera a que esté completamente renderizado
    await tester.pumpWidget(MaterialApp(home: ChatPadres(Usuario("", "", ""))));

    // Verifica si se muestra correctamente el título de la AppBar
    expect(find.text('Juan Pérez'), findsOneWidget);

    // Verifica si se encuentra el icono del menú en la AppBar
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Verifica si se encuentra la imagen circular del alumno en la AppBar
    expect(find.byType(CircleAvatar), findsOneWidget);

    // Verifica si se encuentra el Drawer
    expect(find.byType(Drawer), findsOneWidget);

    // Simula el tap en un elemento del Drawer
    await tester.tap(find.text('Eventos'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la página de eventos
    expect(find.byType(Eventos), findsOneWidget);

    // Simula el tap en otro elemento del Drawer
    await tester.tap(find.text('Información'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la página de información
    expect(find.byType(Informacion), findsOneWidget);

    // Agrega más pruebas según sea necesario
  });

  testWidgets('ChatPadres message send test', (WidgetTester tester) async {
    // Construye el widget y espera a que esté completamente renderizado
    await tester.pumpWidget(MaterialApp(home: ChatPadres(Usuario("", "", ""))));

    // Simula la entrada de un mensaje
    await tester.enterText(find.byType(TextField), 'Mensaje de prueba');

    // Simula el envío del mensaje
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump(); // Espera a que se complete la animación de envío

    // Verifica si se ha añadido el mensaje a la lista de mensajes
    expect(find.text('Mensaje de prueba'), findsOneWidget);

    // Agrega más pruebas según sea necesario
  });

  testWidgets('ChatPadres image selection test', (WidgetTester tester) async {
    // Construye el widget y espera a que esté completamente renderizado
    await tester.pumpWidget(MaterialApp(home: ChatPadres(Usuario("", "", ""))));

    // Simula la selección de una imagen desde la galería
    await tester.tap(find.byIcon(Icons.attach_file));
    await tester.pump(); // Espera a que se complete la animación de selección

    // Verifica si se ha abierto el diálogo de confirmación
    expect(find.byType(AlertDialog), findsOneWidget);

    // Simula la confirmación del envío de la imagen
    await tester.tap(find.text('Enviar').last);
    await tester.pump(); // Espera a que se complete la animación de envío

    // Verifica si se ha añadido la imagen a la lista de mensajes
    expect(find.byType(Image), findsOneWidget);

    // Agrega más pruebas según sea necesario
  });
}

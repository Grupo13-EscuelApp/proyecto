import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';
import 'package:proyecto_inicio/pages/padres/alimentacion_padres_page.dart';

void main() {
  testWidgets('ComidaPadres widget test', (WidgetTester tester) async {
    // Construye el widget y espera a que esté completamente renderizado
    await tester.pumpWidget(MaterialApp(home: ComidaPadres(Usuario("", "", ""))));

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

  testWidgets('ComidaPadres state test', (WidgetTester tester) async {
    // Construye el widget y espera a que esté completamente renderizado
    await tester.pumpWidget(MaterialApp(home: ComidaPadres(Usuario("", "", ""))));

    // Verifica si se muestra correctamente el estado de las comidas
    expect(find.text('Desayuno'), findsOneWidget);
    expect(find.text('Primero'), findsOneWidget);
    expect(find.text('Segundo'), findsOneWidget);
    expect(find.text('Postre'), findsOneWidget);
    expect(find.text('Merienda'), findsOneWidget);

    // Agrega más pruebas según sea necesario
  });

  testWidgets('ComidaPadres navigation test', (WidgetTester tester) async {
    // Construye el widget y espera a que esté completamente renderizado
    await tester.pumpWidget(MaterialApp(home: ComidaPadres(Usuario("", "", ""))));

    // Simula el tap en un elemento de comida
    await tester.tap(find.text('Desayuno'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la ventana de detalles de la comida
    // Aquí puedes agregar expectativas para verificar la navegación a la ventana de detalles de la comida

    // Agrega más pruebas de navegación según sea necesario
  });
}

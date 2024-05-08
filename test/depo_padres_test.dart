import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/main.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';
import 'package:proyecto_inicio/pages/padres/deposicion_padres_page.dart';

void main() {
  testWidgets('DepoPadres widget renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DepoPadres(Usuario("", "", ""))));

    // Verificar elementos de la AppBar
    expect(find.text('Juan Pérez'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);

    // Verificar Drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
    expect(find.text('Eventos'), findsOneWidget);
    expect(find.text('Información'), findsOneWidget);
    expect(find.text('Ajustes'), findsOneWidget);
    expect(find.text('Salir'), findsOneWidget);

    // Verificar deposiciones
    expect(find.text('10:45'), findsOneWidget);
    expect(find.text('Orinal'), findsOneWidget);
    expect(find.text('12:30'), findsOneWidget);
    expect(find.text('Pañal'), findsOneWidget);
    expect(find.text('15:15'), findsOneWidget);
    expect(find.text('Orinal'), findsOneWidget);

    // Verificar botón de regreso
    expect(find.text('Atrás'), findsOneWidget);
  });

  testWidgets('Navigation from Drawer works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DepoPadres(Usuario("", "", ""))));

    await tester.tap(find.text('Eventos'));
    await tester.pumpAndSettle();
    expect(find.byType(Eventos), findsOneWidget);

    await tester.tap(find.text('Información'));
    await tester.pumpAndSettle();
    expect(find.byType(Informacion), findsOneWidget);

    await tester.tap(find.text('Ajustes'));
    await tester.pumpAndSettle();
    expect(find.byType(Ajustes), findsOneWidget);

    await tester.tap(find.text('Salir'));
    await tester.pumpAndSettle();
    expect(find.byType(MyApp), findsOneWidget);
  });


  // Puedes escribir más tests para cubrir otros casos y funcionalidades
}

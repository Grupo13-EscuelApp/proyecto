import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';
import 'package:proyecto_inicio/pages/padres/alimentacion_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/chat_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/deposicion_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/descanso_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/menu_alumno_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/reponer_padres_page.dart';
import 'package:proyecto_inicio/main.dart';


void main() {
  testWidgets('MenuPadres widget test', (WidgetTester tester) async {
    // Construye el widget y espera a que esté completamente renderizado
    await tester.pumpWidget(MaterialApp(home: MenuPadres(Usuario("", "", ""))));

    // Verifica si se muestra correctamente el título de la AppBar
    expect(find.text('Juan Pérez'), findsOneWidget);

    // Verifica si se encuentra el icono del menú en la AppBar
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Verifica si se encuentra el Drawer
    expect(find.byType(Drawer), findsOneWidget);

    // Simula el tap en un elemento del Drawer
    await tester.tap(find.text('Eventos'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la página de eventos
    expect(find.byType(Eventos), findsOneWidget);

    // Simula el tap en un elemento de sección
    await tester.tap(find.text('Deposiciones'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la página de deposiciones de padres
    expect(find.byType(DepoPadres), findsOneWidget);

    // Verifica la presencia de otras secciones en el cuerpo del menú
    expect(find.text('Alimentación'), findsOneWidget);
    expect(find.text('Descanso'), findsOneWidget);
    expect(find.text('Reponer'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);

    // Simula el tap en otras secciones
    await tester.tap(find.text('Alimentación'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la página de alimentación de padres
    expect(find.byType(ComidaPadres), findsOneWidget);

    await tester.tap(find.text('Descanso'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página
    expect(find.byType(DescansoPadres), findsOneWidget);

    await tester.tap(find.text('Reponer'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página
    expect(find.byType(ReponerPadres), findsOneWidget);

    await tester.tap(find.text('Chat'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página
    expect(find.byType(ChatPadres), findsOneWidget);

    // Verifica la presencia de la sección de información en el Drawer
    expect(find.text('Información'), findsOneWidget);

    // Simula el tap en la sección de información
    await tester.tap(find.text('Información'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la página de información
    expect(find.byType(Informacion), findsOneWidget);

    // Simula el tap en la sección de ajustes en el Drawer
    await tester.tap(find.text('Ajustes'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la página de ajustes
    expect(find.byType(Ajustes), findsOneWidget);

    // Simula el tap en la opción de salir en el Drawer
    await tester.tap(find.text('Salir'));
    await tester.pumpAndSettle(); // Espera a que se complete la transición de la página

    // Verifica si se ha navegado a la página de inicio
    expect(find.byType(MyApp), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUserDoc_page.dart';
import 'package:proyecto_inicio/pages/docente/Chat/chat_selec_grup_page.dart';
import 'package:proyecto_inicio/pages/docente/chat/chat_selec_doc_page.dart';
import 'package:proyecto_inicio/pages/docente/inicio_docente_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';

void main() {
  testWidgets('SelecChatDoc UI Test', (WidgetTester tester) async {
    // Construye el widget bajo prueba
    await tester.pumpWidget(MaterialApp(
      home: SelecChatDoc(Usuario("", "", "")),
    ));

    // Verifica si el título se muestra correctamente
    expect(find.text('EscuelApp'), findsOneWidget);

    // Verifica si el botón del menú se muestra correctamente
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Verifica si el botón de añadir se muestra correctamente
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Simula el tap en el botón de añadir
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); // Espera a que aparezca la siguiente pantalla

    // Verifica si la pantalla de añadir usuario se muestra correctamente
    expect(find.byType(AddUserDoc), findsOneWidget);

    // Simula el tap en el botón de atrás del appbar
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle(); // Espera a que aparezca la pantalla anterior

    // Verifica si la pantalla anterior (SelecChatDoc) se muestra correctamente
    expect(find.text('Selecciona una clase'), findsOneWidget);

    // Verifica si los botones de clases se muestran correctamente
    expect(find.text('P0'), findsOneWidget);
    expect(find.text('P1'), findsOneWidget);
    expect(find.text('P2'), findsOneWidget);
    expect(find.text('Todos'), findsOneWidget);

    // Simula el tap en uno de los botones de clases
    await tester.tap(find.text('P0'));
    await tester.pumpAndSettle(); // Espera a que aparezca la siguiente pantalla

    // Verifica si la pantalla ChatDocGrupal se muestra correctamente después de tocar un botón
    expect(find.byType(ChatDocGrupal), findsOneWidget);

    // Simula el tap en el botón "Atrás" del bottom navigation bar
    await tester.tap(find.text('Atrás'));
    await tester.pumpAndSettle(); // Espera a que aparezca la pantalla anterior

    // Verifica si la pantalla InicioDocente se muestra correctamente después de tocar el botón "Atrás"
    expect(find.byType(InicioDocente), findsOneWidget);

    // Simula el tap en el botón del menú para abrir el drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle(); // Espera a que aparezca el drawer

    // Verifica si el drawer se muestra correctamente
    expect(find.text('Menú de Usuario'), findsOneWidget);

    // Simula el tap en uno de los elementos del drawer (Eventos)
    await tester.tap(find.text('Eventos'));
    await tester.pumpAndSettle(); // Espera a que aparezca la siguiente pantalla

    // Verifica si la pantalla Eventos se muestra correctamente después de tocar un elemento del drawer
    expect(find.byType(Eventos), findsOneWidget);
  });
}

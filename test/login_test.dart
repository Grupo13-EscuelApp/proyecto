import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/docente/inicio_docente_page.dart';
import 'package:proyecto_inicio/pages/inicio_alumno_padres_page.dart';
import 'package:proyecto_inicio/pages/login1_page.dart';
import 'package:proyecto_inicio/pages/recuperar_page.dart';


void main() {
  testWidgets('Login1 widget test', (WidgetTester tester) async {
    // Construye el widget y espera a que esté completamente renderizado
    await tester.pumpWidget(MaterialApp(home: Login1()));

    // Verifica si se muestra correctamente el texto "Bienvenidos a EscuelApp"
    expect(find.text('Bienvenidos a EscuelApp'), findsOneWidget);

    // Verifica si se encuentra un TextField para el email
    expect(find.byType(TextField), findsNWidgets(2));

    // Simula la entrada de texto en los campos de email y contraseña
    await tester.enterText(find.byType(TextField).at(0), 'usuario@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'contraseña');

    // Simula el tap en el botón "Log in"
    await tester.tap(find.text('Log in'));
    await tester.pump(); // Espera a que se complete la transición de la página

    // Verifica si la navegación se realizó correctamente para un usuario docente
    expect(find.byType(InicioDocente), findsOneWidget);

    // Verifica si la navegación se realizó correctamente para un usuario padre
    // Cambia este valor según lo que esperas en tu aplicación
    expect(find.byType(InicioAlumno), findsNothing);

    // Verifica si se muestra correctamente el texto "¿Olvidaste tu contraseña?"
    expect(find.text('¿Olvidaste tu contraseña?'), findsOneWidget);

    // Simula el tap en el texto "¿Olvidaste tu contraseña?"
    await tester.tap(find.text('¿Olvidaste tu contraseña?'));
    await tester.pump(); // Espera a que se complete la transición de la página

    // Verifica si la navegación se realizó correctamente hacia la página de recuperación
    expect(find.byType(Recuperar), findsOneWidget);
  });
}

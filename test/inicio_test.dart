
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/login1_page.dart';
import 'package:proyecto_inicio/pages/registro_page.dart';
import 'package:proyecto_inicio/main.dart';

void main() {
  testWidgets('Inicio Widget Test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verificar que se muestre el texto "EscuelApp"
    expect(find.text('EscuelApp'), findsOneWidget);

    // Verificar que se muestre el botón "Log in"
    expect(find.text('Log in'), findsOneWidget);

    // Simular el tap en el botón "Log in"
    await tester.tap(find.text('Log in'));
    await tester.pump(); // Esperar a que se complete la navegación

    // Verificar que se navegue a la página de login (Login1)
    expect(find.byType(Login1), findsOneWidget);

    // Simular el tap en el texto "Regístrate"
    await tester.tap(find.text('Regístrate'));
    await tester.pump(); // Esperar a que se complete la navegación

    // Verificar que se navegue a la página de registro (Registro)
    expect(find.byType(Registro), findsOneWidget);
  });
}

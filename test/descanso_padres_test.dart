import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/padres/descanso_padres_page.dart';

void main() {
  testWidgets('Prueba de IU de DescansoPadres', (WidgetTester tester) async {
    // Construye nuestra aplicación y activa un frame.
    await tester.pumpWidget(MaterialApp(home: DescansoPadres(Usuario("", "", ""))));

    // Verifica que el título de la aplicación se muestre.
    expect(find.text('Juan Pérez'), findsOneWidget);

    // Verifica que la AppBar tenga un ícono de menú como botón de navegación.
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Verifica que la AppBar tenga un avatar de usuario.
    expect(find.byType(CircleAvatar), findsOneWidget);

    // Verifica que el encabezado del Drawer se muestre.
    expect(find.text('Menú de Usuario'), findsOneWidget);

    // Verifica que el Drawer contenga información del correo electrónico.
    expect(find.byType(ListTile), findsWidgets);

    // Verifica que la lista de Descansos se muestre.
    expect(find.byType(ListView), findsOneWidget);

    // Verifica que los elementos de la lista de Descansos se muestren correctamente.
    expect(find.byIcon(Icons.shopping_basket), findsNWidgets(3)); // Verifica que cada elemento tenga un ícono de canasta de compras.
    expect(find.byIcon(Icons.watch_later), findsNWidgets(3)); // Verifica que cada elemento tenga un ícono de reloj de alarma.
  });

  // Agrega más casos de prueba según sea necesario para cubrir otras funcionalidades específicas de DescansoPadres.
}

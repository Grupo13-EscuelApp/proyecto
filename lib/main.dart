import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUserDoc_page.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUsuPadre_page.dart';
import 'package:proyecto_inicio/pages/inicio_login.dart';
import 'package:proyecto_inicio/pages/login1_page.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';
import 'package:proyecto_inicio/pages/padres/alimentacion_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/chat_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/deposicion_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/descanso_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/menu_alumno_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/reponer_padres_page.dart';
import 'package:proyecto_inicio/pages/recuperar_page.dart';
import 'package:proyecto_inicio/pages/registro_page.dart'; // Importa la página login1_page.dart
import 'package:proyecto_inicio/pages/inicio_alumno_padres_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define la ruta principal de tu aplicación
      initialRoute: '/',
      // Define las rutas de tu aplicación
      routes: {
        '/': (context) => Inicio(), // Ruta principal
        '/login1': (context) => Login1(), // Ruta para la página Login1()
        '/registro': (context) => Registro(), // Ruta para la página Registro()
        '/recuperar': (context) => Recuperar(), // Ruta para la página Recuperar()
        '/InicioAlumno': (context) => InicioAlumno(), // Ruta para la página InicioAlumno()
        '/Informacion': (context) => Informacion(), // Ruta para la página Informacion()
        '/Eventos': (context) => Eventos(), // Ruta para la página Eventos()
        '/Ajustes': (context) => Ajustes(), // Ruta para la página Ajustes()
        '/AddUserPadre': (context) => AddUserPadre(), // Ruta para la página AddUserPadre()
        '/AddUserDoc': (context) => AddUserDoc(), // Ruta para la página AddUserDoc()
        '/MenuPadres': (context) => MenuPadres(), // Ruta para la página MenuPadres()
        '/ComidaPadres': (context) => ComidaPadres(), // Ruta para la página ComidaPadres()
        '/DepoPadres': (context) => DepoPadres(), // Ruta para la página DepoPadres()
        '/DescansoPadres': (context) => DescansoPadres(), // Ruta para la página DescansoPadres()
        '/ReponerPadres': (context) => ReponerPadres(), // Ruta para la página ReponerPadres()
        '/ChatPadres': (context) => ChatPadres(), // Ruta para la página ChatPadres()


      },
    );
  }
}





import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUserDoc_page.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUsuPadre_page.dart';
import 'package:proyecto_inicio/pages/docente/Chat/chat_selec_doc_page.dart';
import 'package:proyecto_inicio/pages/docente/Chat/chat_selec_grup_page.dart';
import 'package:proyecto_inicio/pages/docente/alimentacion_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/chat_alumno_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/deposicion_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/descanso_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/menu_docente_alumno_page.dart';
import 'package:proyecto_inicio/pages/docente/p0_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/p1_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/p2_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/reponer_docente_page.dart';
import 'package:proyecto_inicio/pages/inicio_alumno_padres_page.dart';
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
import 'package:proyecto_inicio/pages/registro_page.dart';

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
        '/InicioAlumno': (context) => InicioAlumno(Usuario as Usuario), // Ruta para la página InicioAlumno()
        '/Informacion': (context) => Informacion(Usuario as Usuario), // Ruta para la página Informacion()
        '/Eventos': (context) => Eventos(Usuario as Usuario), // Ruta para la página Eventos()
        '/Ajustes': (context) => Ajustes(Usuario as Usuario), // Ruta para la página Ajustes()
        '/AddUserPadre': (context) => AddUserPadre(Usuario as Usuario), // Ruta para la página AddUserPadre()
        '/AddUserDoc': (context) => AddUserDoc(Usuario as Usuario), // Ruta para la página AddUserDoc()
        '/MenuPadres': (context) => MenuPadres(Usuario as Usuario), // Ruta para la página MenuPadres()
        '/ComidaPadres': (context) => ComidaPadres(Usuario as Usuario), // Ruta para la página ComidaPadres()
        '/DepoPadres': (context) => DepoPadres(Usuario as Usuario), // Ruta para la página DepoPadres()
        '/DescansoPadres': (context) => DescansoPadres(Usuario as Usuario), // Ruta para la página DescansoPadres()
        '/ReponerPadres': (context) => ReponerPadres(Usuario as Usuario), // Ruta para la página ReponerPadres()
        '/ChatPadres': (context) => ChatPadres(Usuario as Usuario), // Ruta para la página ChatPadres()
        '/P0_Docente': (context) => P0_Docente(Usuario as Usuario), // Ruta para la página P0_Docente()
        '/P1_Docente': (context) => P1_Docente(Usuario as Usuario), // Ruta para la página P1_Docente()
        '/P2_Docente': (context) => P2_Docente(Usuario as Usuario), // Ruta para la página P2_Docente()
        '/MenuDocentes': (context) => MenuDocentes(
          nombreAlumno: 'Nombre del alumno seleccionado',
          apellidoAlumno: 'Apellido del alumno seleccionado',
          fotoUrlAlumno: 'URL de la foto del alumno seleccionado', usuario: Usuario as Usuario,
        ), // Ruta para la página MenuDocentes()
        '/DepoDoc': (context) => DepoDoc(
          Usuario as Usuario,
          nombreAlumno: 'Nombre del alumno',
          apellidoAlumno: 'Apellido del alumno',
          fotoUrlAlumno: 'https://via.placeholder.com/108x105',


        ),// Ruta para la pagina DepoDoc()
        '/ComidaDocente': (context) => ComidaDocente(Usuario as Usuario,
          nombreAlumno: 'Nombre del alumno',
          apellidoAlumno: 'Apellido del alumno',
          fotoUrlAlumno: 'https://via.placeholder.com/108x105',), // Ruta para la página ComidaDocente()
        '/DescansoDoc': (context) => DescansoDoc(
          Usuario as Usuario,
          nombreAlumno: 'Nombre del alumno',
          apellidoAlumno: 'Apellido del alumno',
          fotoUrlAlumno: 'https://via.placeholder.com/108x105',), // Ruta para la página DescansoDoc()
        '/ReponerDoc': (context) => ReponerDoc(Usuario as Usuario,
          nombreAlumno: 'Nombre del alumno',
          apellidoAlumno: 'Apellido del alumno',
          fotoUrlAlumno: 'https://via.placeholder.com/108x105',), //Ruta para la página ReponerDoc()
        '/ChatDoc': (context) => ChatDoc(Usuario as Usuario,
          nombreAlumno: 'Nombre del alumno',
          apellidoAlumno: 'Apellido del alumno',
          fotoUrlAlumno: 'https://via.placeholder.com/108x105',),//Ruta para la página ChatDoc()
        '/SelecChatDoc': (context) => SelecChatDoc(Usuario as Usuario), // Ruta para la página SelecChatDoc()
        // Ruta para la página SelecChatDoc()
        '/ChatDocGrupal': (context) => ChatDocGrupal(), // Ruta para la página SelecChatDoc()

      },

    );
  }
}

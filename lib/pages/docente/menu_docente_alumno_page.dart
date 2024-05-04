import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/docente/deposicion_docente_page.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/padres/alimentacion_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/chat_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/deposicion_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/descanso_padres_page.dart';
import 'package:proyecto_inicio/pages/padres/reponer_padres_page.dart';
import '../../main.dart';
import '../BBDD/DatabaseHelper.dart';
import '../BBDD/usuario_class.dart';
import '../menu/informacion_page.dart';

void main() {
  Usuario usuario = Usuario("","","");
  runApp(
    MenuDocentes(
      nombreAlumno: 'Nombre del alumno', // Reemplazar con el nombre del alumno seleccionado
      apellidoAlumno: 'Apellido del alumno', // Reemplazar con el apellido del alumno seleccionado
      fotoUrlAlumno: 'https://via.placeholder.com/108x105', // Reemplazar con la URL de la foto del alumno seleccionado
      usuario: usuario,
    ),
  );
}

class MenuDocentes extends StatelessWidget {
  final String nombreAlumno;
  final String apellidoAlumno;
  final String fotoUrlAlumno;
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final Usuario usuario;

  MenuDocentes({

    Key? key,
    required this.nombreAlumno,
    required this.apellidoAlumno,
    required this.fotoUrlAlumno,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String emailUsuario = usuario.email;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white, // Color del fondo del Scaffold en blanco
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('$nombreAlumno $apellidoAlumno'), // Mostrar el nombre del alumno seleccionado
          centerTitle: true, // Centra el título en la AppBar
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu), // Icono de las tres rayas
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abre el Drawer al presionar el icono
                },
              );
            },
          ),
          actions: [
            // Reemplazar el icono de agregar usuario con la imagen circular del alumno seleccionado
            CircleAvatar(
              backgroundImage: NetworkImage(fotoUrlAlumno),
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.brown, // Color marrón
                  Colors.transparent, // Color transparente
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        drawer: Drawer(
          // Contenido del menú deslizable
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.brown, // Color de fondo marrón
                ),
                child: const Text(
                  'Menú de Usuario',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text(emailUsuario, style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Agregar aquí la funcionalidad para el email
                },
              ),
              ListTile(
                title: const Text('Eventos', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Eventos(usuario)),
                  );
                },
              ),
              ListTile(
                title: const Text('Información', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Informacion(usuario)),
                  );
                },
              ),
              ListTile(
                title: const Text('Ajustes', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ajustes(usuario)),
                  );
                },
              ),
              ListTile(
                title: const Text('Salir', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection('Alimentación', Icons.restaurant, Colors.green, 'Nunito', 13, FontWeight.w500, context),
              _buildSection('Deposiciones', Icons.baby_changing_station, Colors.green, 'Nunito', 13, FontWeight.w500, context),
              _buildSection('Descanso', Icons.bed, Colors.green, 'Nunito', 13, FontWeight.w500, context),
              _buildSection('Reponer', Icons.shopping_basket, Colors.green, 'Nunito', 13, FontWeight.w500, context),
              _buildSection('Chat', Icons.chat, Colors.green, 'Nunito', 13, FontWeight.w500, context),
              SizedBox(height: 80), // Separación
              ElevatedButton(
                onPressed: () {
                  // Navegar a la página anterior o a la pantalla de inicio principal del menú de padres
                  Navigator.pop(context);
                },
                child: Text(
                  'Atrás',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Color de fondo
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60), // Tamaño del botón
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, Color iconColor, String fontFamily, double fontSize, FontWeight fontWeight, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Deposiciones') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DepoDoc(
                usuario,
                nombreAlumno: nombreAlumno,
                apellidoAlumno: apellidoAlumno,
                fotoUrlAlumno: fotoUrlAlumno,
              ),
            ),
          );


        } else if(title == 'Alimentación') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ComidaPadres(usuario)),
          );
        } else if( title == 'Descanso') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DescansoPadres(usuario)),
          );
        } else if(title == 'Reponer'){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReponerPadres(usuario)),
          );
        } else if(title == 'Chat'){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPadres(usuario)),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
            SizedBox(width: 40),
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                color: Colors.black, // Color del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}

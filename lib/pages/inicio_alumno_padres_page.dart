import 'package:flutter/material.dart';

import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/padres/menu_alumno_padres_page.dart';

import '../main.dart';
import 'añadir/addUserDoc_page.dart';
import 'menu/informacion_page.dart';

void main() {
  runApp(const InicioAlumno());
}

class InicioAlumno extends StatelessWidget {
  const InicioAlumno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white, // Color del fondo del Scaffold en blanco
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EscuelApp'),
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
            IconButton(
              icon: const Icon(Icons.add), // Icono de agregar usuario
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserDoc()),
                );
              },
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
                title: const Text('Nombre de usuario', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Agregar aquí la funcionalidad para el nombre de usuario
                },
              ),
              ListTile(
                title: const Text('Email', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Agregar aquí la funcionalidad para el email
                },
              ),
              ListTile(
                title: const Text('Eventos', style: TextStyle(color: Colors.white)),
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Eventos()),
                  );
                },
              ),
              ListTile(
                title: const Text('Información', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Informacion()),
                  );
                },
              ),
              ListTile(
                title: const Text('Ajustes', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ajustes()),
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
        body: Center( // Centra el ListView horizontalmente
          child: Container(
            height: 289,
            child: ListView(
              scrollDirection: Axis.horizontal, // Desplazamiento horizontal
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPadres()),
                    );
                  },
                  child: Alumno(
                    nombre: 'Nombre del hijo 1',
                    apellido: 'Apellido del hijo 1',
                    clase: 'Clase del hijo 1',
                    fotoUrl: 'https://via.placeholder.com/108x105',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPadres()),
                    );
                  },
                  child: Alumno(
                    nombre: 'Nombre del hijo 2',
                    apellido: 'Apellido del hijo 2',
                    clase: 'Clase del hijo 2',
                    fotoUrl: 'https://via.placeholder.com/108x105',
                  ),
                ),
                // Agrega más Alumnos según sea necesario
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Alumno extends StatelessWidget {
  final String nombre;
  final String apellido;
  final String clase;
  final String fotoUrl;

  const Alumno({
    required this.nombre,
    required this.apellido,
    required this.clase,
    required this.fotoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 204,
        height: 289,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 43.75,
              child: Container(
                width: 204,
                height: 245.25,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center( // Centra el contenido verticalmente
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          nombre,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          apellido,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          clase,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 46.98,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuPadres()),
                  );
                },
                child: Container(
                  width: 107.56,
                  height: 104.78,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(fotoUrl),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 20,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

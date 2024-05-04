import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUserDoc_page.dart';
import 'package:proyecto_inicio/pages/docente/inicio_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/menu_docente_alumno_page.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';
import '../../main.dart';
import '../BBDD/DatabaseHelper.dart';

void main() {
  Usuario usuario = Usuario("","","");
  runApp(P0_Docente(usuario));
}

class P0_Docente extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final Usuario usuario;
  P0_Docente(this.usuario,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String emailUsuario = usuario.email;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white, // Color del fondo del Scaffold en blanco
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Curso P0'),
          centerTitle: true, // Centra el título en la AppBar
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.red), // Botón de flecha hacia atrás en rojo
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => InicioDocente(Usuario as Usuario)),
                  );
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
                  MaterialPageRoute(builder: (context) => AddUserDoc(usuario)),
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
        body: Center(
          // Centra el ListView horizontalmente
          child: Container(
            height: 289,
            child: ListView(
              scrollDirection: Axis.horizontal, // Desplazamiento horizontal
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuDocentes(
                        nombreAlumno: 'Alumno 1',
                        apellidoAlumno: 'Apellido 1',
                        fotoUrlAlumno: 'https://via.placeholder.com/108x105',
                        usuario: usuario,
                      )),
                    );
                  },
                  child: Alumno(
                    nombre: 'Alumno 1',
                    apellido: 'Apellido 1',
                    clase: 'P0',
                    fotoUrl: 'https://via.placeholder.com/108x105',
                    usuario: usuario,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuDocentes(
                        nombreAlumno: 'Alumno 2',
                        apellidoAlumno: 'Apellido 2',
                        fotoUrlAlumno: 'https://via.placeholder.com/108x105',
                        usuario: usuario,
                      )),
                    );
                  },
                  child: Alumno(
                    nombre: 'Alumno 2',
                    apellido: 'Apellido 2',
                    clase: 'P0',
                    fotoUrl: 'https://via.placeholder.com/108x105',
                    usuario: usuario,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuDocentes(
                        nombreAlumno: 'Alumno 3',
                        apellidoAlumno: 'Apellido 3',
                        fotoUrlAlumno: 'https://via.placeholder.com/108x105',
                        usuario: usuario,
                      )),
                    );
                  },
                  child: Alumno(
                    nombre: 'Alumno 3',
                    apellido: 'Apellido 3',
                    clase: 'P0',
                    fotoUrl: 'https://via.placeholder.com/108x105',
                    usuario: usuario,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuDocentes(
                        nombreAlumno: 'Alumno 4',
                        apellidoAlumno: 'Apellido 4',
                        fotoUrlAlumno: 'https://via.placeholder.com/108x105',
                        usuario: usuario,
                      )),
                    );
                  },
                  child: Alumno(
                    nombre: 'Alumno 4',
                    apellido: 'Apellido 4',
                    clase: 'P0',
                    fotoUrl: 'https://via.placeholder.com/108x105',
                    usuario: usuario,
                  ),
                ),

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
  final Usuario usuario;

  const Alumno({
    required this.nombre,
    required this.apellido,
    required this.clase,
    required this.fotoUrl,
    required this.usuario,
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
                child: Center(
                  // Centra el contenido verticalmente
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
                    MaterialPageRoute(builder: (context) => MenuDocentes(
                      nombreAlumno: nombre,
                      apellidoAlumno: apellido,
                      fotoUrlAlumno: fotoUrl,
                      usuario: usuario,
                    )),
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

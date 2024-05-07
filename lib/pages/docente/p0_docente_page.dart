import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUserDoc_page.dart';
import 'package:proyecto_inicio/pages/docente/inicio_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/menu_docente_alumno_page.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';
import '../../main.dart';
import '../BBDD/DatabaseAlumnos.dart';

void main() {
  Usuario usuario = Usuario("", "", "");
  runApp(P0_Docente(usuario));
}

class P0_Docente extends StatefulWidget {
  final Usuario usuario;
  P0_Docente(this.usuario, {Key? key}) : super(key: key);

  @override
  _P0_DocenteState createState() => _P0_DocenteState();
}

class _P0_DocenteState extends State<P0_Docente> {
  final DatabaseAlumnos databaseAlumnos = DatabaseAlumnos();
  late Future<List<Map<String, dynamic>>> _alumnosFuture;

  @override
  void initState() {
    super.initState();
    _alumnosFuture = databaseAlumnos.getAlumnosByCurso('P0'); // Obtener alumnos del curso P0
  }

  @override
  Widget build(BuildContext context) {
    String emailUsuario = widget.usuario.email;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Curso P0'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.red),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => InicioDocente(widget.usuario)),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserDoc(widget.usuario)),
                );
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.brown,
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.brown,
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
                    MaterialPageRoute(builder: (context) => Eventos(widget.usuario)),
                  );
                },
              ),
              ListTile(
                title: const Text('Información', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Informacion(widget.usuario)),
                  );
                },
              ),
              ListTile(
                title: const Text('Ajustes', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ajustes(widget.usuario)),
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
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _alumnosFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No hay alumnos en este curso.'));
            } else {
              return Center(
                child: Container(
                  height: 289,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> alumnoData = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          // Navegar a la página del menú del alumno con los datos obtenidos
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuDocentes(
                                nombreAlumno: alumnoData['nombre'],
                                apellidoAlumno: alumnoData['apellido'],
                                fotoUrlAlumno: alumnoData['fotoUrl'],
                                usuario: widget.usuario,
                              ),
                            ),
                          );
                        },
                        child: Alumno(
                          nombre: alumnoData['nombre'],
                          apellido: alumnoData['apellido'],
                          clase: alumnoData['curso'],
                          fotoUrl: alumnoData['fotoUrl'],
                          usuario: widget.usuario,
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          },
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
                  // Navegar a la página del menú del alumno con los datos obtenidos
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuDocentes(
                        nombreAlumno: nombre,
                        apellidoAlumno: apellido,
                        fotoUrlAlumno: fotoUrl,
                        usuario: usuario,
                      ),
                    ),
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

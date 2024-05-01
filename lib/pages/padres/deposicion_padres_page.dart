import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import '../../main.dart';
import '../menu/informacion_page.dart';

class Deposicion {
  final String hora; // Hora de la deposición
  final String tipo; // Tipo de deposición (pañal u orinal)

  Deposicion(this.hora, this.tipo);
}

void main() {
  runApp(const DepoPadres());
}

class DepoPadres extends StatelessWidget {
  const DepoPadres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Datos simulados del alumno seleccionado (reemplazar con los datos reales)
    String nombreAlumno = 'Juan';
    String apellidoAlumno = 'Pérez';
    String fotoUrlAlumno = 'https://via.placeholder.com/150';

    // Datos simulados de las deposiciones del alumno
    List<Deposicion> deposiciones = [
      Deposicion('10:45', 'Orinal'),
      Deposicion('12:30', 'Pañal'),
      Deposicion('15:15', 'Orinal'),
    ];

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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...deposiciones.map((deposicion) {
              return _buildSection(deposicion.hora, deposicion.tipo, context);
            }).toList(),
            SizedBox(height: 130), // Separación
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: ElevatedButton(
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
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 175), // Tamaño del botón
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String hora, String tipo, BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.amberAccent, // Fondo azul
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinea los elementos al principio y al final del contenedor
          children: [
            Icon(
              Icons.access_time,
              color: Colors.deepOrangeAccent, // Color amarillo
              size: 24,
            ),
            SizedBox(width: 0), // Separación
            Text(
              hora,
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                color: Colors.black, // Texto en blanco para contrastar con el fondo azul
              ),
            ),
            SizedBox(width: 70), // Separación
            Icon(
              Icons.baby_changing_station,
              color: Colors.blue, // Color negro
              size: 24,
            ),
            SizedBox(width: 0), // Separación
            Text(
              tipo,
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                color: Colors.black, // Texto en blanco para contrastar con el fondo azul
              ),
            ),
          ],
        ),
      ),
    );
  }
}

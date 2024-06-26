import 'package:flutter/material.dart';
import '../../main.dart';
import '../BBDD/DatabaseHelper.dart';
import '../BBDD/usuario_class.dart';
import '../menu/ajustes_page.dart';
import '../menu/eventos_page.dart';
import '../menu/informacion_page.dart';

class Descanso {
  final String horaInicio; // Hora de inicio del descanso
  final String horaFin; // Hora de fin del descanso
  final int duracion; // Duración del descanso en minutos


  Descanso(this.horaInicio, this.horaFin, this.duracion);
}

void main() {
  Usuario usuario = Usuario("","","");
  runApp(DescansoPadres(usuario));
}

class DescansoPadres extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
final Usuario usuario;
  DescansoPadres(this.usuario,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Datos simulados del alumno seleccionado (reemplazar con los datos reales)
    String nombreAlumno = 'Juan';
    String apellidoAlumno = 'Pérez';
    String fotoUrlAlumno = 'https://via.placeholder.com/150';
    String emailUsuario = usuario.email;

    // Datos simulados de los descansos del alumno
    List<Descanso> descansos = [
      Descanso('10:45', '11:30', 45),
      Descanso('12:30', '13:15', 45),
      Descanso('15:15', '16:00', 45),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...descansos.map((descanso) {
              return _buildSection(descanso.horaInicio, descanso.horaFin, descanso.duracion, context);
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

  Widget _buildSection(String horaInicio, String horaFin, int duracion, BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.amberAccent, // Fondo amarillo
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Hora de inicio y fin a la izquierda
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.shopping_basket,
                      color: Colors.deepOrangeAccent, // Color amarillo
                      size: 24,
                    ),
                    SizedBox(width: 10), // Separación
                    Text(
                      '$horaInicio - $horaFin',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                        color: Colors.black, // Texto en blanco para contrastar con el fondo amarillo
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Duración a la derecha
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.watch_later,
                      color: Colors.deepOrangeAccent, // Color amarillo
                      size: 24,
                    ),
                    SizedBox(width: 10), // Separación
                    Text(
                      '$duracion min',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                        color: Colors.black, // Texto en blanco para contrastar con el fondo amarillo
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}

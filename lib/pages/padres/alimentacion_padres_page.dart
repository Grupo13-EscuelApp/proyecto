import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import '../../main.dart';
import '../BBDD/DatabaseHelper.dart';
import '../BBDD/usuario_class.dart';
import '../menu/informacion_page.dart';

// Clase ficticia para simular los datos de la comida del alumno
class Comida {
  final String tipo; // Tipo de comida (Desayuno, Almuerzo, Cena, etc.)
  final String estado; // Estado de la comida (Comido todo, Bastante, Nada)

  Comida(this.tipo, this.estado);
}

void main() {
  Usuario usuario = Usuario("","","");
  runApp(ComidaPadres(usuario));
}

class ComidaPadres extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final Usuario usuario;
  ComidaPadres(this.usuario, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Datos simulados del alumno seleccionado (reemplazar con los datos reales)
    String nombreAlumno = 'Juan';
    String apellidoAlumno = 'Pérez';
    String fotoUrlAlumno = 'https://via.placeholder.com/150';
    String emailUsuario = usuario.email;

    // Datos simulados de la comida del alumno
    List<Comida> comidas = [
      Comida('Desayuno', 'Todo'),
      Comida('Primero', 'Bastante'),
      Comida('Segundo', 'Nada'),
      Comida('Postre', 'Poco'),
      Comida('Merienda', 'Nada'),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...comidas.map((comida) {
                return _buildSection(comida.tipo, comida.estado, context);
              }).toList(),
              SizedBox(height: 130), // Separación
            ],
          ),
        ),
        bottomNavigationBar: Padding(
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
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 150), // Tamaño del botón
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String estado, BuildContext context) {
    Color estadoColor;
    switch (estado) {
      case 'Todo':
        estadoColor = Colors.green;
        break;
      case 'Bastante':
        estadoColor = Colors.amber;
        break;
      case 'Poco':
        estadoColor = Colors.orange;
        break;
      case 'Nada':
        estadoColor = Colors.red;
        break;
      default:
        estadoColor = Colors.black;
        break;
    }

    return GestureDetector(
      onTap: () {
        // Navegar a la ventana de detalles de la comida
        // Aquí puedes realizar la navegación a la ventana de detalles de la comida
      },
      child: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent, // Fondo azul
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
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              estado,
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                color: estadoColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

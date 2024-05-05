import 'package:flutter/material.dart';
import '../../main.dart';
import '../BBDD/DatabaseHelper.dart';
import '../BBDD/usuario_class.dart';
import '../menu/ajustes_page.dart';
import '../menu/eventos_page.dart';
import '../menu/informacion_page.dart';

class Reponer {
  final String tarea; // Nombre de la tarea

  Reponer(this.tarea);
}

void main() {
  Usuario usuario = Usuario("","","");
  runApp(ReponerDoc(usuario, nombreAlumno: '', apellidoAlumno: '', fotoUrlAlumno: '',));
}

class ReponerDoc extends StatefulWidget {
  final String nombreAlumno;
  final String apellidoAlumno;
  final String fotoUrlAlumno;
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final Usuario usuario;

  ReponerDoc(this.usuario, {
    Key? key,
    required this.nombreAlumno,
    required this.apellidoAlumno,
    required this.fotoUrlAlumno,
  }) : super(key: key);

  @override
  _ReponerDocState createState() => _ReponerDocState();
}
class _ReponerDocState extends State<ReponerDoc> {
  // Lista de tareas
  List<Reponer> tareas = [];

  @override
  Widget build(BuildContext context) {
    String emailUsuario = widget.usuario.email;

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white, // Color del fondo del Scaffold en blanco
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('${widget.nombreAlumno} ${widget.apellidoAlumno}'), // Mostrar el nombre del alumno seleccionado
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
              backgroundImage: NetworkImage(widget.fotoUrlAlumno),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                _mostrarDialogoAgregarTarea(context, tareas);
              },
              icon: Icon(Icons.add),
              label: Text('Añadir'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
              ),
            ),
            SizedBox(height: 20),
            ...tareas.map((tarea) {
              return _buildSection(tarea.tarea);
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

  Widget _buildSection(String tarea) {
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
          mainAxisAlignment: MainAxisAlignment.center, // Alinea los elementos al principio y al final del contenedor
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.shopping_basket, // Icono de camiseta
                      color: Colors.deepOrangeAccent, // Color amarillo
                      size: 24,
                    ),
                    SizedBox(width: 10), // Separación
                    Text(
                      tarea, // Nombre de la tarea
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

  void _mostrarDialogoAgregarTarea(BuildContext context, List<Reponer> tareas) {
    TextEditingController tareaController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Añadir Tarea'),
          content: TextField(
            controller: tareaController,
            decoration: InputDecoration(
              labelText: 'Nombre de la tarea',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el cuadro de diálogo sin guardar cambios
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                String nuevaTarea = tareaController.text;

                // Validar que se haya ingresado una tarea
                if (nuevaTarea.isNotEmpty) {
                  // Agregar la nueva tarea a la lista
                  setState(() {
                    tareas.add(Reponer(nuevaTarea));
                  });

                  // Cerrar el cuadro de diálogo
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Por favor ingresa el nombre de la tarea.')),
                  );
                }
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}

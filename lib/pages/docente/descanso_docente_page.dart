import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import '../../main.dart';
import '../BBDD/DatabaseHelper.dart';
import '../BBDD/usuario_class.dart';
import '../menu/informacion_page.dart';

class Descanso {
  final String hora; // Hora de la deposición
  final String duracion; // Tipo de deposición (pañal u orinal)

  Descanso(this.hora, this.duracion);
}

void main() {
  Usuario usuario = Usuario("","","");
  runApp(DescansoDoc(usuario, nombreAlumno: '', apellidoAlumno: '', fotoUrlAlumno: '',));
}

class DescansoDoc extends StatefulWidget {
  final String nombreAlumno;
  final String apellidoAlumno;
  final String fotoUrlAlumno;
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final Usuario usuario;

  DescansoDoc(this.usuario,{
    Key? key,
    required this.nombreAlumno,
    required this.apellidoAlumno,
    required this.fotoUrlAlumno,
  }) : super(key: key);

  @override
  _DescansoDocState createState() => _DescansoDocState();
}

class _DescansoDocState extends State<DescansoDoc> {
  // Lista de deposiciones del alumno
  List<Descanso> deposiciones = [];

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
                    MaterialPageRoute(builder: (context) => Eventos(Usuario as Usuario)),
                  );
                },
              ),
              ListTile(
                title: const Text('Información', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Informacion(Usuario as Usuario)),
                  );
                },
              ),
              ListTile(
                title: const Text('Ajustes', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ajustes(Usuario as Usuario)),
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
                _mostrarDialogoAgregarDeposicion(context, deposiciones);
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
            ...deposiciones.map((deposicion) {
              return _buildSection(deposicion.hora, deposicion.duracion, context);
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
              Icons.access_time,
              color: Colors.deepOrangeAccent, //
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

  void _mostrarDialogoAgregarDeposicion(BuildContext context, List<Descanso> deposiciones) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController horaController = TextEditingController();
        TextEditingController tipoController = TextEditingController();

        return AlertDialog(
          title: Text('Añadir Deposición'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: horaController,
                decoration: InputDecoration(
                  labelText: 'Hora de inicio y hora de fin de descanso',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: tipoController,
                decoration: InputDecoration(
                  labelText: 'duracion',
                ),
              ),
            ],
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
                String hora = horaController.text;
                String duracion = tipoController.text;

                // Validar que se haya ingresado la hora y el tipo
                if (hora.isNotEmpty && duracion.isNotEmpty) {
                  // Agregar la nueva deposición a la lista
                  setState(() {
                    deposiciones.add(Descanso(hora, duracion));
                  });

                  // Cerrar el cuadro de diálogo
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Por favor ingresa la hora y la duracion del descanso.')),
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

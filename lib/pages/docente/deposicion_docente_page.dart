import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/BBDD/DatabaseHelper.dart';
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
  runApp(const DepoDoc(
    nombreAlumno: '',
    apellidoAlumno: '',
    fotoUrlAlumno: '',
  ));
}

class DepoDoc extends StatefulWidget {
  final String nombreAlumno;
  final String apellidoAlumno;
  final String fotoUrlAlumno;

  const DepoDoc({
    Key? key,
    required this.nombreAlumno,
    required this.apellidoAlumno,
    required this.fotoUrlAlumno,
  }) : super(key: key);

  @override
  _DepoDocState createState() => _DepoDocState();
}

class _DepoDocState extends State<DepoDoc> {
  String emailUsuario = ''; // Variable para almacenar el email del usuario
  List<Deposicion> deposiciones = [];

  @override
  void initState() {
    super.initState();
    obtenerEmailUsuario(); // Llama a la función para obtener el email del usuario al iniciar la pantalla
  }

  void obtenerEmailUsuario() async {
    // Aquí utilizamos la clase DatabaseHelper para obtener el email del usuario
    // Supongamos que el método para obtener el email del usuario se llama obtenerEmailUsuario()
    emailUsuario = await DatabaseHelper().obtenerEmailUsuario();
    setState(() {}); // Actualiza el estado para reflejar el email del usuario en el Drawer
  }

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menú de Usuario',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      emailUsuario, // Mostrar el email del usuario obtenido de la base de datos
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
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

  void _mostrarDialogoAgregarDeposicion(BuildContext context, List<Deposicion> deposiciones) {
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
                  labelText: 'Hora',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: tipoController,
                decoration: InputDecoration(
                  labelText: 'Tipo',
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
                String tipo = tipoController.text;

                // Validar que se haya ingresado la hora y el tipo
                if (hora.isNotEmpty && tipo.isNotEmpty) {
                  // Agregar la nueva deposición a la lista
                  setState(() {
                    deposiciones.add(Deposicion(hora, tipo));
                  });

                  // Cerrar el cuadro de diálogo
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Por favor ingresa la hora y el tipo de la deposición.')),
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

import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';
import '../../main.dart';


class Comida {
  final String tipo; // Tipo de comida (Desayuno, Almuerzo, Cena, etc.)
  String estado; // Estado de la comida (Comido todo, Bastante, Poco, Nada)

  Comida(this.tipo, this.estado);
}

void main() {
  Usuario usuario = Usuario("", "", "");
  runApp(ComidaDocente(
    usuario,
    nombreAlumno: '',
    apellidoAlumno: '',
    fotoUrlAlumno: '',
  ));
}

class ComidaDocente extends StatefulWidget {
  final String nombreAlumno;
  final String apellidoAlumno;
  final String fotoUrlAlumno;
  final Usuario usuario;

  ComidaDocente(
      this.usuario, {
        Key? key,
        required this.nombreAlumno,
        required this.apellidoAlumno,
        required this.fotoUrlAlumno,
      }) : super(key: key);

  @override
  _ComidaDocenteState createState() => _ComidaDocenteState();
}

class _ComidaDocenteState extends State<ComidaDocente> {
  // Datos simulados de la comida del alumno
  List<Comida> comidas = [
    Comida('Desayuno', 'Todo'),
    Comida('Primero', 'Bastante'),
    Comida('Segundo', 'Nada'),
    Comida('Postre', 'Poco'),
    Comida('Merienda', 'Nada'),
  ];

  @override
  Widget build(BuildContext context) {
    String emailUsuario = widget.usuario.email;
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.nombreAlumno} ${widget.apellidoAlumno}'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Usa un icono de flecha hacia atrás en lugar del menú
          onPressed: () {
            Navigator.pop(context); // Navega a la página anterior
          },
        ),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.fotoUrlAlumno),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
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
                  MaterialPageRoute(builder: (context) => Eventos(Usuario as Usuario)), // Pasa el usuario a la página de eventos
                );
              },
            ),
            ListTile(
              title: const Text('Información', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Informacion(Usuario as Usuario)), // Pasa el usuario a la página de información
                );
              },
            ),
            ListTile(
              title: const Text('Ajustes', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ajustes(Usuario as Usuario)), // Pasa el usuario a la página de ajustes
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
      body: ListView.builder(
        itemCount: comidas.length,
        itemBuilder: (context, index) {
          return _buildSection(comidas[index]);
        },
      ),
    );
  }

  Widget _buildSection(Comida comida) {
    Color estadoColor;

    switch (comida.estado) {
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
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: estadoColor, // Fondo con color del estado
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
              comida.tipo,
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                color: Colors.black, // Color del texto en negro
              ),
            ),
            DropdownButton<String>(
              value: comida.estado,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  // Actualiza el estado seleccionado de la comida
                  comida.estado = newValue!;
                });
              },
              items: <String>['Todo', 'Bastante', 'Poco', 'Nada']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

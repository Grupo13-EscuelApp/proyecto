import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';

// Clase ficticia para simular los datos de la comida del alumno
class Comida {
  final String tipo; // Tipo de comida (Desayuno, Almuerzo, Cena, etc.)
  String estado; // Estado de la comida (Comido todo, Bastante, Poco, Nada)

  Comida(this.tipo, this.estado);
}

void main() {
  Usuario usuario = Usuario("","","");
  runApp(ComidaDocente(usuario));
}

class ComidaDocente extends StatefulWidget {
  const ComidaDocente(Usuario usuario, {Key? key}) : super(key: key);

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
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white, // Color del fondo del Scaffold en blanco
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Comida del alumno'), // Título de la AppBar
          centerTitle: true, // Centra el título en la AppBar
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...comidas.map((comida) {
                return _buildSection(comida);
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

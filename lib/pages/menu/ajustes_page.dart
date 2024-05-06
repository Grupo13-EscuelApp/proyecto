import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';
import 'package:proyecto_inicio/pages/inicio_alumno_padres_page.dart';

import '../../main.dart';
import '../BBDD/DatabaseHelper.dart';
import 'eliminar_page.dart';

void main() {
  Usuario usuario = Usuario("","","");
  runApp(Ajustes(usuario));
}

class Ajustes extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final Usuario usuario;

  Ajustes(this.usuario, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AjustesPage(usuario: usuario),
    );
  }
}

class AjustesPage extends StatefulWidget {
  final Usuario usuario;

  const AjustesPage({required this.usuario, Key? key}) : super(key: key);

  @override
  _AjustesPageState createState() => _AjustesPageState();
}

class _AjustesPageState extends State<AjustesPage> {
  bool _notificacionesActivadas = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
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
              title: const Text('Nombre de usuario',
                  style: TextStyle(color: Colors.white)),
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
              title:
              const Text('Eventos', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Eventos(widget.usuario)),
                );
              },
            ),
            ListTile(
              title: const Text('Información',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Informacion(widget.usuario)),
                );
              },
            ),
            ListTile(
              title:
              const Text('Ajustes', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Agregar aquí la funcionalidad para los ajustes
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
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre del alumno',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black), // Texto en negro
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Apellidos',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black), // Texto en negro
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    children: [
                      Text(
                        'Notificaciones',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black), // Texto en negro
                      ),
                      SizedBox(width: 40.0),
                      Switch(
                        value: _notificacionesActivadas,
                        onChanged: (value) {
                          setState(() {
                            _notificacionesActivadas = value;
                          });
                        },
                        activeTrackColor: Colors.orange,
                        inactiveTrackColor: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    children: [
                      Text(
                        'Eliminar',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black), // Texto en negro
                      ),
                      SizedBox(width: 20.0),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Eliminar(widget.usuario)),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              // Navegar a la ventana InicioAlumno
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InicioAlumno(widget.usuario)),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 120.0,
              )),
            ),
            child: Text(
              'Guardar',
              style: TextStyle(fontSize: 20.0),
            ),
          ),

          SizedBox(height: 60.0),
        ],
      ),
    );
  }
}

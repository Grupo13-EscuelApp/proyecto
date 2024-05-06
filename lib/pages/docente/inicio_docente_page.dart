import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUserDoc_page.dart';
import 'package:proyecto_inicio/pages/docente/Chat/chat_selec_grup_page.dart';
import 'package:proyecto_inicio/pages/docente/p0_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/p1_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/p2_docente_page.dart';
import 'package:proyecto_inicio/pages/inicio_login.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';

import '../BBDD/DatabaseHelper.dart';
import '../BBDD/usuario_class.dart';

void main() {
  Usuario usuario = Usuario("","","");
  runApp(InicioDocente(usuario));
}

class InicioDocente extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final Usuario usuario;
  InicioDocente(this.usuario, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String emailUsuario = usuario.email;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white, // Color del fondo del Scaffold en blanco
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EscuelApp'),
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
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserDoc(usuario)),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 0), // Espacio desde la parte superior
                Text(
                  'Selecciona una clase', // Texto principal
                  style: TextStyle(
                    fontSize: 24.0, // Tamaño del texto más grande
                    fontWeight: FontWeight.bold, // Peso de la fuente en negrita
                    color: Colors.black, // Color del texto
                  ),
                ),
                SizedBox(height: 50), // Espacio entre el texto y el primer botón
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => P0_Docente(usuario)),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent), // Cambia el color de fondo del botón a naranja
                  ),
                  child: SizedBox(
                    width: 100, // Ancho del botón
                    child: Center(
                      child: Text(
                        'P0', // Texto del botón
                        style: TextStyle(
                          color: Colors.black, // Cambia el color del texto a negro
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40), // Espacio entre el primer y segundo botón
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => P1_Docente(usuario)),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent), // Cambia el color de fondo del botón a verde
                  ),
                  child: SizedBox(
                    width: 100, // Ancho del botón
                    child: Center(
                      child: Text(
                        'P1', // Texto del botón
                        style: TextStyle(
                          color: Colors.black, // Cambia el color del texto a negro
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40), // Espacio entre el segundo y tercer botón
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => P2_Docente(usuario)),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent), // Cambia el color de fondo del botón a verde
                  ),
                  child: SizedBox(
                    width: 100, // Ancho del botón
                    child: Center(
                      child: Text(
                        'P2', // Texto del botón
                        style: TextStyle(
                          color: Colors.black, // Cambia el color del texto a negro
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 200), // Espacio desde la parte inferior
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelecChatDoc(usuario)),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Cambia el color de fondo del botón a verde
                  ),
                  child: SizedBox(
                    width: double.infinity, // Utiliza el ancho máximo disponible
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat, color: Colors.white), // Icono de chat
                        SizedBox(width: 8), // Espacio entre el icono y el texto
                        Text(
                          'Ir a Chat', // Texto del botón
                          style: TextStyle(
                            color: Colors.white, // Cambia el color del texto a blanco
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/a%C3%B1adir/addUserDoc_page.dart';
import 'package:proyecto_inicio/pages/docente/p0_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/p1_docente_page.dart';
import 'package:proyecto_inicio/pages/docente/p2_docente_page.dart';
import 'package:proyecto_inicio/pages/inicio_login.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';

void main() {
  runApp(const InicioDocente());
}

class InicioDocente extends StatelessWidget {
  const InicioDocente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => AddUserDoc()),
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
        body: Center(
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
                    MaterialPageRoute(builder: (context) => P0_Docente()),
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
                    MaterialPageRoute(builder: (context) => P1_Docente()),
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
                    MaterialPageRoute(builder: (context) => P2_Docente()),
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
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 300, // Ancho del botón de chat
          child: FloatingActionButton.extended(
            onPressed: () {
              // Acción para el botón de chat
            },
            backgroundColor: Colors.green,
            icon: Icon(Icons.chat),
            label: Text('Chat'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/menu/ajustes_page.dart';
import 'package:proyecto_inicio/pages/menu/eventos_page.dart';
import 'package:proyecto_inicio/pages/menu/informacion_page.dart';

import '../../main.dart';

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
          title: const Text('Docente1'), // Cambia el título a "Docente1"
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
            IconButton(
              icon: const Icon(Icons.add), // Icono de agregar usuario
              onPressed: () {
                // Acción al presionar el botón de agregar usuario
              },
            ),
          ],
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
                  // Acción para el botón P0
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
                  // Acción para el botón P1
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent), // Cambia el color de fondo del botón a verde
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
              SizedBox(height: 40), // Espacio entre el segundo y tercer botón
              ElevatedButton(
                onPressed: () {
                  // Acción para el botón P2
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent), // Cambia el color de fondo del botón a verde
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
            ],
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Acción para el botón de chat
          },
          backgroundColor: Colors.green, // Color de fondo verde para el botón de chat
          icon: Icon(Icons.chat), // Icono de chat
          label: Text('Chat'), // Texto "Chat"
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Posición del botón flotante
        floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation, // Animación del botón flotante
        bottomNavigationBar: BottomAppBar(
          elevation: 0, // Sin sombra
          color: Colors.transparent, // Fondo transparente
          child: SizedBox(height: 20), // Sin contenido
        ),
      ),
    );
  }
}

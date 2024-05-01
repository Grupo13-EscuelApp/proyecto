import 'package:flutter/material.dart';

import '../../main.dart';
import '../menu/ajustes_page.dart';
import '../menu/eventos_page.dart';
import '../menu/informacion_page.dart';

void main() {
  runApp(const AddUserPadre());
}

class AddUserPadre extends StatelessWidget {
  const AddUserPadre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Añadir Usuario'),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Acceso solo para profesional docente',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20, // Tamaño de fuente ajustado
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w800,
                      ),
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
}

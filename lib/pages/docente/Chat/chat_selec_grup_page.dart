import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/BBDD/DatabaseHelper.dart';

import 'package:proyecto_inicio/pages/a%C3%B1adir/addUserDoc_page.dart';
import 'package:proyecto_inicio/pages/docente/Chat/chat_selec_doc_page.dart';
import 'package:proyecto_inicio/pages/docente/inicio_docente_page.dart';

import '../../../main.dart';
import '../../BBDD/usuario_class.dart';
import '../../menu/ajustes_page.dart';
import '../../menu/eventos_page.dart';
import '../../menu/informacion_page.dart';

void main() {
  Usuario usuario = Usuario("", "", "");
  runApp(SelecChatDoc(usuario));
}

class SelecChatDoc extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final Usuario usuario;

  SelecChatDoc(this.usuario, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String emailUsuario = usuario.email;
    return Scaffold(
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
              SizedBox(height: 0),
              Text(
                'Selecciona una clase',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ChatDocGrupal()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.deepOrangeAccent,
                  ),
                ),
                child: SizedBox(
                  width: 100,
                  child: Center(
                    child: Text(
                      'P0',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ChatDocGrupal()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.deepOrangeAccent,
                  ),
                ),
                child: SizedBox(
                  width: 100,
                  child: Center(
                    child: Text(
                      'P1',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ChatDocGrupal()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.deepOrangeAccent,
                  ),
                ),
                child: SizedBox(
                  width: 100,
                  child: Center(
                    child: Text(
                      'P2',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ChatDocGrupal()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.deepOrangeAccent,
                  ),
                ),
                child: SizedBox(
                  width: 100,
                  child: Center(
                    child: Text(
                      'Todos',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent, // Hace el color de fondo transparente
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0), // Margen horizontal de 20 píxeles a cada lado
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => InicioDocente(usuario)),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Aumenta el espacio alrededor del texto
              child: Text(
                'Atrás',
                style: TextStyle(color: Colors.white, fontSize: 18.0), // Aumenta el tamaño del texto
              ),
            ),
          ),
        ),
      ),
    );
  }
}

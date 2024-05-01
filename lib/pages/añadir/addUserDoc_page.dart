import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';
import '../menu/ajustes_page.dart';
import '../menu/eventos_page.dart';
import '../menu/informacion_page.dart';

void main() {
  runApp(AddUserDoc());
}

class AddUserDoc extends StatefulWidget {
  const AddUserDoc({Key? key}) : super(key: key);

  @override
  _AddUserDocState createState() => _AddUserDocState();
}

class _AddUserDocState extends State<AddUserDoc> {
  String? _selectedCourse;
  File? _image;

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
                onTap: () {},
              ),
              ListTile(
                title: const Text('Email', style: TextStyle(color: Colors.white)),
                onTap: () {},
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Apellidos',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre de Padre',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre de Madre',
                      ),
                    ),
                    DropdownButton<String>(
                      dropdownColor: Colors.grey[200],
                      value: _selectedCourse,
                      hint: Text('Curso', style: TextStyle(color: Colors.black)),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      items: <String>['P0', 'P1', 'P2'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: Colors.black)),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedCourse = value;
                        });
                      },
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        _getImage();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey), // Añade un borde para indicar que es un área interactiva
                        ),
                        child: _image == null
                            ? Icon(Icons.add_a_photo) // Muestra un icono si no hay ninguna imagen seleccionada
                            : Image.file(_image!), // Muestra la imagen seleccionada si la hay
                      ),
                    ),
                    SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 100.0,
                        )),
                      ),
                      child: Text(
                        'Añadir',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No se seleccionó ninguna imagen.');
      }
    });
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:proyecto_inicio/pages/docente/inicio_docente_page.dart';
import '../../main.dart';
import '../BBDD/DatabaseAlumnos.dart';
import '../BBDD/usuario_class.dart';
import '../menu/ajustes_page.dart';
import '../menu/eventos_page.dart';
import '../menu/informacion_page.dart';

void main() {
  Usuario usuario = Usuario("", "", "");
  runApp(AddUserDoc(usuario));
}

class AddUserDoc extends StatefulWidget {
  final DatabaseAlumnos databaseAlumnos = DatabaseAlumnos();
  final Usuario usuario;
  AddUserDoc(this.usuario, {Key? key}) : super(key: key);

  @override
  _AddUserDocState createState() => _AddUserDocState();
}

class _AddUserDocState extends State<AddUserDoc> {
  String? _selectedCourse;
  File? _image;
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _emailPadreController = TextEditingController();
  final TextEditingController _emailMadreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String emailUsuario = widget.usuario.email;
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
                title: Text(emailUsuario, style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Eventos', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Eventos(widget.usuario)),
                  );
                },
              ),
              ListTile(
                title: const Text('Información', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Informacion(widget.usuario)),
                  );
                },
              ),
              ListTile(
                title: const Text('Ajustes', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ajustes(widget.usuario)),
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
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
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
                      controller: _nombreController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                      ),
                    ),
                    TextField(
                      controller: _apellidosController,
                      decoration: InputDecoration(
                        labelText: 'Apellidos',
                      ),
                    ),
                    TextField(
                      controller: _emailPadreController,
                      decoration: InputDecoration(
                        labelText: 'Email del Padre',
                      ),
                    ),
                    TextField(
                      controller: _emailMadreController,
                      decoration: InputDecoration(
                        labelText: 'Email de Madre',
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
                          border: Border.all(color: Colors.grey),
                        ),
                        child: _image == null
                            ? Icon(Icons.add_a_photo)
                            : Image.file(_image!),
                      ),
                    ),
                    SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () async {
                        // Verificar que se haya seleccionado una imagen
                        if (_image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Por favor selecciona una imagen.')),
                          );
                          return;
                        }

                        // Verificar que se hayan ingresado todos los campos
                        if (_selectedCourse == null ||
                            _nombreController.text.isEmpty ||
                            _apellidosController.text.isEmpty ||
                            _emailPadreController.text.isEmpty ||
                            _emailMadreController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Por favor completa todos los campos.')),
                          );
                          return;
                        }

                        // Guardar la imagen en el dispositivo
                        final String imagePath = await _saveImageToDevice(_image!);

                        // Guardar los datos del alumno en la base de datos
                        await widget.databaseAlumnos.insertAlumno({
                          DatabaseAlumnos.colNombre: _nombreController.text,
                          DatabaseAlumnos.colApellidos: _apellidosController.text,
                          DatabaseAlumnos.colEmailPadre: _emailPadreController.text,
                          DatabaseAlumnos.colEmailMadre: _emailMadreController.text,
                          DatabaseAlumnos.colCurso: _selectedCourse!,
                          DatabaseAlumnos.colFoto: imagePath,
                        });

                        // Mostrar un mensaje de éxito
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Alumno añadido correctamente.')),
                        );

                        // Navegar a la ventana InicioDocente
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InicioDocente(widget.usuario)),
                        );
                      },
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
            ],
          ),
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

  Future<String> _saveImageToDevice(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/imagen_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final File newImage = await imageFile.copy(imagePath);
    return imagePath;
  }
}

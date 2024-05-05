import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../BBDD/DatabaseHelper.dart';
import '../BBDD/usuario_class.dart';
import '../menu/ajustes_page.dart';
import '../menu/eventos_page.dart';
import '../menu/informacion_page.dart';

class ChatDoc extends StatefulWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final Usuario usuario;
  final String nombreAlumno;
  final String apellidoAlumno;
  final String fotoUrlAlumno;

  ChatDoc(
      this.usuario, {
        Key? key,
        required this.nombreAlumno,
        required this.apellidoAlumno,
        required this.fotoUrlAlumno,
      }) : super(key: key);

  @override
  _ChatDocState createState() => _ChatDocState();
}

class _ChatDocState extends State<ChatDoc> {
  TextEditingController _messageController = TextEditingController();
  List<Map<String, dynamic>> mensajes = [];
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    String emailUsuario = widget.usuario.email;

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('${widget.nombreAlumno} ${widget.apellidoAlumno}'),
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/fondochat.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: mensajes.length,
                      itemBuilder: (context, index) {
                        if (mensajes[index]['tipo'] == 'texto') {
                          return Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  mensajes[index]['mensaje'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          // Si es una imagen
                          return Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Image.file(
                                  File(mensajes[index]['archivo']),
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.grey[200]!.withOpacity(0.2),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.camera),
                          color: Colors.green,
                          onPressed: _getImageFromCamera,
                        ),
                        IconButton(
                          icon: Icon(Icons.attach_file),
                          color: Colors.green,
                          onPressed: _getImageFromGallery,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: 'Escribe un mensaje...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          color: Colors.green,
                          onPressed: () {
                            _sendMessage(); // Envía el mensaje
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para obtener una imagen desde la cámara
  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _showConfirmationDialog(); // Mostrar diálogo de confirmación antes de enviar
    }
  }

  // Método para obtener una imagen desde la galería
  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _showConfirmationDialog(); // Mostrar diálogo de confirmación antes de enviar
    }
  }

  // Método para enviar el mensaje
  void _sendMessage() {
    if (_messageController.text.isNotEmpty || _imageFile != null) {
      setState(() {
        if (_messageController.text.isNotEmpty) {
          mensajes.add({'tipo': 'texto', 'mensaje': _messageController.text});
          _messageController.clear();
        }
        if (_imageFile != null) {
          mensajes.add({'tipo': 'imagen', 'archivo': _imageFile!.path});
          _imageFile = null; // Limpiar la imagen después de enviarla
        }
      });
    }
  }

  // Método para mostrar el diálogo de confirmación
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmar envío"),
          content: Text("¿Estás seguro de que quieres enviar esta imagen?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
                _sendMessage(); // Envía el mensaje
              },
              child: Text("Enviar"),
            ),
          ],
        );
      },
    );
  }
}

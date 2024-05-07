import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_inicio/pages/BBDD/DatabaseHelper.dart';




class ChatDocGrupal extends StatefulWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  _ChatDocGrupalState createState() => _ChatDocGrupalState();
}


class _ChatDocGrupalState extends State<ChatDocGrupal> {
  TextEditingController _messageController = TextEditingController();
  List<Map<String, dynamic>> mensajes = [];
  File? _imageFile;

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(

          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Retrocede a la página anterior
            },
          ),

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

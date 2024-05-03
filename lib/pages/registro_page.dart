import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_inicio/pages/BBDD/DatabaseHelper.dart';

import '../main.dart';

class Registro extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController tipoController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image/fondo1.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 100,
            child: Center(
              child: Text(
                'EscuelApp',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24.0),
                  Text(
                    'Bienvenidos a EscuelApp',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                    controller: passController,
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                    controller: tipoController,
                    decoration: InputDecoration(
                      hintText: 'Código',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                  SizedBox(height: 80.0),
                  ElevatedButton(
                    onPressed: () async {
                      String email = emailController.text;
                      String password = passController.text;
                      String tipo = tipoController.text;

                      if (email.isEmpty || password.isEmpty || tipo.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Todos los campos son obligatorios.')),
                        );
                        return;
                      }

                      int insertedId = await databaseHelper.insertRegistro({
                        'email': email,
                        'pass': password,
                        'codigo': tipo,
                      });

                      if (insertedId != -1) {
                        Fluttertoast.showToast(
                          msg: 'Registro insertado correctamente',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Error al insertar el registro',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text('Registrar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(Registro());
}

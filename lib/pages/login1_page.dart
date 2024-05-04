import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_inicio/pages/docente/inicio_docente_page.dart';
import 'package:proyecto_inicio/pages/inicio_alumno_padres_page.dart';
import 'package:proyecto_inicio/pages/recuperar_page.dart';
import 'package:proyecto_inicio/pages/BBDD/DatabaseHelper.dart';

import 'package:proyecto_inicio/pages/BBDD/usuario_class.dart';

class Login1 extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  Login1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return Stack(
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
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 80.0),
                        ElevatedButton(
                          onPressed: () async {
                            String email = emailController.text;
                            String password = passwordController.text;

                            if (email.isEmpty || password.isEmpty) {
                              Fluttertoast.showToast(
                                msg: 'Debes ingresar un correo electrónico y una contraseña.',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                              return;
                            }

                            // Buscar usuario en la base de datos
                            Usuario? usuario = await databaseHelper.buscarUsuario(email, password);
                            if (usuario == null) {
                              Fluttertoast.showToast(
                                msg: 'Correo electrónico no registrado o contraseña incorrecta.',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                              return;
                            }

                            // Verificar si la contraseña es correcta
                            if (usuario.password != password) {
                              Fluttertoast.showToast(
                                msg: 'Contraseña incorrecta.',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                              return;
                            }

                            // Determinar a qué pantalla redirigir
                            if (usuario.tipo == "docente") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InicioDocente(usuario)),
                              );
                            } else if (usuario.tipo == "padre") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InicioAlumno(usuario)),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: Text('Log in'),
                        ),
                        SizedBox(height: 32.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Recuperar()),
                            );
                          },
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

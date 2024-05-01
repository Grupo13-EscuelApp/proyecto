import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/docente/inicio_docente_page.dart';
import 'package:proyecto_inicio/pages/recuperar_page.dart';

import 'inicio_alumno_padres_page.dart'; // Importa la página InicioAlumnoPadresPage


class Login1 extends StatelessWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/image/fondo1.png', // Ruta de la imagen de fondo
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
              top: 100, // Ajusta la posición vertical del texto
              child: Center(
                child: Text(
                  'EscuelApp', // Texto sobre la imagen
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Color blanco para el texto
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
                  color: Colors.white, // Color de fondo del contenedor
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
                        color: Colors.black, // Cambia el color de texto a negro
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 32.0),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'E-mail', // Texto sugerido para la primera caja de texto
                        hintStyle: TextStyle(color: Colors.grey[400]), // Cambia el color del texto sugerido a gris claro
                      ),
                    ),
                    SizedBox(height: 24.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Contraseña', // Texto sugerido para la segunda caja de texto
                        hintStyle: TextStyle(color: Colors.grey[400]), // Cambia el color del texto sugerido a gris claro
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 80.0),
                    ElevatedButton(
                      onPressed: () {
                        String email = emailController.text;
                        String password = passwordController.text;

                        if (email.isEmpty) {
                          // Si el campo de correo electrónico está vacío, muestra un diálogo
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text("El campo de correo electrónico no puede estar vacío."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Cierra el diálogo
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (email == "docente" && password.isEmpty) {
                          // Si el correo electrónico es "docente" y la contraseña está vacía, navega a la ventana InicioDocente
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InicioDocente()),
                          );
                        } else if (email == "padre" && password.isEmpty) {
                          // Si el correo electrónico es "padre" y la contraseña está vacía, navega a la ventana InicioPadres
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InicioAlumno()),
                          );
                        } else {
                          // En otros casos, puedes agregar alguna lógica adicional o mostrar un mensaje de error
                          // Por ejemplo, podrías mostrar un diálogo indicando que las credenciales son incorrectas
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InicioAlumno()),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Cambia el color del botón a rojo
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Cambia el color del texto a negro
                      ),
                      child: Text('Log in'),
                    ),
                    SizedBox(height: 32.0),
                    GestureDetector(
                      onTap: () {
                        // Navegar a la página RecuperarPage()
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Recuperar()),
                        );
                      },
                      child: Text(
                        'Olvidastes tu contraseña?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue, // Cambia el color del texto a azul
                          decoration: TextDecoration.underline, // Subraya el texto
                        ),
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
}

import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
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
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      // Texto sugerido para la primera caja de texto
                      hintStyle: TextStyle(
                          color: Colors.grey[
                          400]), // Cambia el color del texto sugerido a gris claro
                    ),
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      // Texto sugerido para la segunda caja de texto
                      hintStyle: TextStyle(
                          color: Colors.grey[
                          400]), // Cambia el color del texto sugerido a gris claro
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Código',
                      // Texto sugerido para la primera caja de texto
                      hintStyle: TextStyle(
                          color: Colors.grey[
                          400]), // Cambia el color del texto sugerido a gris claro
                    ),
                  ),
                  SizedBox(height: 80.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red), // Cambia el color del botón a rojo
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Cambia el color del texto a blanco
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

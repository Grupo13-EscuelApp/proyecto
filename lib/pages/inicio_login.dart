import 'package:flutter/material.dart';
import 'package:proyecto_inicio/pages/login1_page.dart'; // Importa la página login1_page.dart
import 'package:proyecto_inicio/pages/registro_page.dart'; // Importa la página registro.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Inicio(), // Define Inicio como la página de inicio
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality( // Agrega un Directionality como ancestro de Scaffold
        textDirection: TextDirection.ltr, // Define la dirección del texto
        child: Stack(
          children: [
            // Fondo de pantalla
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/image/fondo1.png', // Ruta de la imagen
                fit: BoxFit.cover, // Ajuste de la imagen para cubrir todo el contenedor
              ),
            ),
            // Texto "EscuelApp"
            Positioned(
              top: 109, // Posición Y del texto
              left: 95, // Posición X del texto
              child: Text(
                'EscuelApp',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w800, // ExtraBold
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            // Botón "Log in"
            Positioned(
              left: 40, // Posición X del botón
              top: 599, // Posición Y del botón
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login1()), // Navega a la página login1_page.dart
                  );
                },
                child: Boton(),
              ),
            ),
            // Texto "No tienes cuenta? Registrate"
            Positioned(
              left: 105, // Posición X del texto
              top: 662, // Posición Y del texto
              child: YourRegisterTextWidget(),
            ),
            // Otros widgets de contenido aquí
          ],
        ),
      ),
    );
  }
}

class Boton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar a la página Login1()
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login1()),
        );
      },
      child: Container(
        width: 310, // Ancho del botón
        height: 58, // Alto del botón
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 310,
                height: 58,
                decoration: BoxDecoration(
                  color: Color(0xFFFF0808),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            Positioned(
              left: 131,
              top: 18,
              child: Text(
                'Log in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Widget personalizado para el texto de "Regístrate"
class YourRegisterTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar a la página Registro()
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Registro()),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'No tienes cuenta? ',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            TextSpan(
              text: 'Regístrate',
              style: TextStyle(fontSize: 14, color: Colors.red, decoration: TextDecoration.underline),
            ),
            // Puedes agregar más TextSpan si necesitas estilos adicionales para otros fragmentos de texto
          ],
        ),
      ),
    );
  }
}

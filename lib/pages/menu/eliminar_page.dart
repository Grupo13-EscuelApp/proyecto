import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../main.dart';
import '../BBDD/DatabaseHelper.dart';
import '../BBDD/bloc_eliminar_bloque_page.dart';
import '../BBDD/usuario_class.dart';
import 'ajustes_page.dart';
import 'eventos_page.dart';
import 'informacion_page.dart';

void main() {
  Usuario usuario = Usuario("","","");
  runApp(Eliminar(usuario));
}

class Eliminar extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final TextEditingController _controller = TextEditingController();
  final Usuario usuario;

  Eliminar(this.usuario, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String emailUsuario = usuario.email;
    return BlocProvider(
      create: (_) => EliminarBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Eliminar usuario'),
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
                title: const Text('Nombre de usuario',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Agregar aquí la funcionalidad para el nombre de usuario
                },
              ),
              ListTile(
                title: Text(emailUsuario, style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Agregar aquí la funcionalidad para el email
                },
              ),
              ListTile(
                title:
                const Text('Eventos', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Eventos(usuario)),
                  );
                },
              ),
              ListTile(
                title: const Text('Información',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Informacion(usuario)),
                  );
                },
              ),
              ListTile(
                title:
                const Text('Ajustes', style: TextStyle(color: Colors.white)),
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
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<EliminarBloc, String>(
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Si deseas eliminar su cuenta, introduce la contraseña para continuar con la acción.',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14.0,
                            fontFamily: 'NunitoSans',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 60.0),
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 120.0),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              String enteredPassword = _controller.text.trim();
                              if (enteredPassword.isNotEmpty) {
                                // Mostrar el toast de confirmación
                                Fluttertoast.showToast(
                                  msg: '¿Estás seguro de eliminar tu cuenta?',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 5,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                );

                                // Mostrar el diálogo de confirmación
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Confirmar eliminación'),
                                      content: Text('¿Estás seguro de eliminar tu cuenta?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Dispatch del evento confirmar
                                            BlocProvider.of<EliminarBloc>(context).add(EliminarEvent.confirmar);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Eliminar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: 'Por favor ingresa tu contraseña',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                );
                              }
                            },
                            icon: Icon(Icons.delete),
                            label: Text('Eliminar'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 100.0,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


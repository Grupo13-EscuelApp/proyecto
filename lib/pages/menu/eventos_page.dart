import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl para formatear la fecha

import '../../main.dart';
import '../BBDD/DatabaseHelper.dart';
import '../BBDD/usuario_class.dart';
import 'ajustes_page.dart';
import 'informacion_page.dart';

void main() {
  Usuario usuario = Usuario("","","");
  runApp(Eventos(usuario));
}

class Eventos extends StatefulWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final Usuario usuario;
  Eventos(this.usuario, {Key? key}) : super(key: key);

  @override
  _EventosState createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  String _eventoTexto = '';
  Map<DateTime, String> _eventosPorDia = {};

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _eventoController = TextEditingController();
    String tipo = widget.usuario.tipo;
    String emailUsuario = widget.usuario.email;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white, // Color del fondo del Scaffold en blanco
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Eventos'),
          centerTitle: true, // Centra el título en la AppBar
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu), // Icono de las tres rayas
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abre el Drawer al presionar el icono
                },
              );
            },
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.brown, // Color marrón
                  Colors.transparent, // Color transparente
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        drawer: Drawer(
          // Contenido del menú deslizable
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.brown, // Color de fondo marrón
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
                  // Agregar aquí la funcionalidad para los eventos
                },
              ),
              ListTile(
                title: const Text('Información', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Informacion(Usuario as Usuario),
                  ));
                },
              ),
              ListTile(
                title: const Text('Ajustes', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ajustes(Usuario as Usuario)),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botón para agregar evento
            tipo == 'docente' ? ElevatedButton(
              onPressed: () {
              showDialog(
                   context: context,
                  builder: (context) {
                    return AlertDialog(
                     title: Text('Ingrese el evento'),
                     content: TextField(
                     controller: _eventoController,
              ),
                      actions: <Widget>[
                     ElevatedButton(
                       onPressed: () {
                       Navigator.of(context).pop();
                      },
                      child: Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                      setState(() {
                         _eventoTexto = _eventoController.text;
                     });
                       Navigator.of(context).pop();
                       },
                      child: Text('Aceptar'),
                  ),
                 ],
                );
               },
              );
             },
              child: Text('+ Agregar Evento'),
            ) : Container(),
            // Calendario
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) {
                return isSameDay(day, _selectedDay);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _eventoTexto = _eventosPorDia[selectedDay] ?? '';
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                weekendTextStyle: TextStyle(color: Colors.black),
                defaultTextStyle: TextStyle(color: Colors.black),
                outsideTextStyle: TextStyle(color: Colors.grey),
                outsideDaysVisible: true,
              ),
            ),
            // Texto con la información del día seleccionado
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.brown, // Color de fondo marrón
                border: Border.all(color: Colors.black), // Borde de color negro y ancho 1
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
              ),
              child: Text(
                // Formatea la fecha para mostrar solo día, mes y año
                'Información del día seleccionado: ${DateFormat('dd/MM/yyyy').format(_selectedDay)}\nEvento: $_eventoTexto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

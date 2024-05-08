
import 'package:flutter_bloc/flutter_bloc.dart';


// Enum para definir los eventos
enum EliminarEvent { confirmar, cancelar }

class EliminarBloc extends Bloc<EliminarEvent, String> {
  EliminarBloc() : super('');

  @override
  Stream<String> mapEventToState(EliminarEvent event) async* {
    if (event == EliminarEvent.confirmar) {
      // Emitir el mensaje de confirmación
      yield 'Eliminando...';
      // Simular una operación de eliminación
      await Future.delayed(Duration(seconds: 2));
      yield 'Eliminado exitosamente';
    } else {
      // Emitir un mensaje de cancelación
      yield 'Eliminación cancelada';
    }
  }
}

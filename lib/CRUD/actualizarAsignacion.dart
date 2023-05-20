import 'package:flutter/material.dart';

import '../firestoredb.dart';

class ActualizarAsignacion extends StatefulWidget {
  const ActualizarAsignacion({Key? key}) : super(key: key);

  @override
  State<ActualizarAsignacion> createState() => _ActualizarAsignacionState();
}

class _ActualizarAsignacionState extends State<ActualizarAsignacion> {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    TextEditingController salonController = TextEditingController(text: arguments['salon']);
    TextEditingController edificioController = TextEditingController(text: arguments['edificio']);
    TextEditingController horarioController = TextEditingController(text: arguments['horario']);
    TextEditingController docenteController = TextEditingController(text: arguments['docente']);
    TextEditingController materiaController = TextEditingController(text: arguments['materia']);
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva asignacion'),),
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: ListView(
          children: [
            TextField(controller: salonController,decoration: const InputDecoration(labelText: 'SALON',)),
            const SizedBox(height: 5,),
            TextField(controller: edificioController,decoration: const InputDecoration(labelText: 'EDIFICIO',)),
            const SizedBox(height: 5,),
            TextField(controller: horarioController,decoration: const InputDecoration(labelText: 'HORARIO',)),
            const SizedBox(height: 5,),
            TextField(controller: docenteController,decoration: const InputDecoration(labelText: 'DOCENTE',)),
            const SizedBox(height: 5,),
            TextField(controller: materiaController,decoration: const InputDecoration(labelText: 'MATERIA',)),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: () async{
              Map<String, dynamic> asignacion = {
                "salon": salonController.text,
                "edificio":edificioController.text,
                "horario":horarioController.text,
                "docente":docenteController.text,
                "materia":materiaController.text
              };
              await actualizarAsignacion(arguments['aid'],asignacion).then((_){
                Navigator.pop(context);
                Navigator.pop(context);
              });
            }, child: const Text('Actualizar'))
          ],
        ),
      ),
    );
  }
}

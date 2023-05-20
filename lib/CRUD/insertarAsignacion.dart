import 'package:dam_u4_proyecto2_19400616/firestoredb.dart';
import 'package:flutter/material.dart';
class InsertarAsignacion extends StatefulWidget {
  const InsertarAsignacion({Key? key}) : super(key: key);

  @override
  State<InsertarAsignacion> createState() => _InsertarAsignacionState();
}

class _InsertarAsignacionState extends State<InsertarAsignacion> {
  TextEditingController salonController = TextEditingController(text: '');
  TextEditingController edificioController = TextEditingController(text: '');
  TextEditingController horarioController = TextEditingController(text: '');
  TextEditingController docenteController = TextEditingController(text: '');
  TextEditingController materiaController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
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
              await insertarAsignacion(asignacion).then((_){
                Navigator.pop(context);
              });
            }, child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}

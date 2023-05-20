import 'package:dam_u4_proyecto2_19400616/firestoredb.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InsertarAsistencia extends StatefulWidget {
  const InsertarAsistencia({Key? key}) : super(key: key);

  @override
  State<InsertarAsistencia> createState() => _InsertarAsistenciaState();
}

class _InsertarAsistenciaState extends State<InsertarAsistencia> {
  TextEditingController revisorController = TextEditingController(text: '');

  DateTime fechayhora = DateTime.now();
  String fecha = "Selecciona la fecha y hora";
  Future<void> _selectFechaHora(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: fechayhora ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          fechayhora = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          fecha = "Fecha: ${fechayhora.toString().substring(0,10)} - Hora: ${fechayhora.toString().substring(11,19)}";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: const Text('Asisencia'),),
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: ListView(
          children: [
            ElevatedButton(onPressed: () async{
              await _selectFechaHora(context);
              print(fechayhora);
            }, child: Text(fecha)),
            const SizedBox(height: 20,),
            TextField(controller: revisorController,decoration: const InputDecoration(labelText: 'REVISOR',)),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: () async{
              DateTime fh = DateTime.now();
              Map<String, dynamic> asistencia = {
                "fechahora": fechayhora,
                "revisor": revisorController.text
              };
              await insertarAsistencia(arguments['aid'],asistencia).then((_){
                Navigator.pop(context);
              });
            }, child: const Text('Tomar asistencia'))
          ],
        ),
      ),
    );
  }
}

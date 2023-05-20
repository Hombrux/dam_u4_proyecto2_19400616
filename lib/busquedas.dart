import 'package:flutter/material.dart';

class Busquedas extends StatefulWidget {
  const Busquedas({Key? key}) : super(key: key);

  @override
  State<Busquedas> createState() => _BusquedasState();
}

class _BusquedasState extends State<Busquedas> {
  TextEditingController docenteController = TextEditingController(text: '');
  TextEditingController revisorController = TextEditingController(text: '');
  TextEditingController edificioController = TextEditingController(text: '');

  DateTime fechaInicio = DateTime.now();
  DateTime fechaFin = DateTime.now();
  String fI="Fecha de inicio",fF="Fecha final";

  Future<void> _selectFechaInicio(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Fecha inicial mostrada en el selector
      firstDate: DateTime(2000), // Fecha mínima seleccionable
      lastDate: DateTime(2100), // Fecha máxima seleccionable
    );

    // Verifica si el usuario seleccionó una fecha
    if (picked != null && picked != fechaInicio) {
      setState(() {
        fechaInicio = picked; // Almacena la fecha seleccionada en el campo de fecha
        fI = fechaInicio.toString().substring(0,10);
      });
    }
  }

  Future<void> _selectFechaFin(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != fechaFin) {
      setState(() {
        fechaFin = picked;
        fF = fechaFin.toString().substring(0,10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consultas'),),
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
            const Text('Consultar asistencias de un docente'),
            TextField(controller: docenteController,decoration: const InputDecoration(hintText: 'Docente',)),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: () async{
              await Navigator.pushNamed(context, '/verAsisDocente',arguments: {
                "docente" : docenteController.text
              });
              setState(() {});
            }, child: const Text('Consultar')),
            const SizedBox(height: 5,),
            const Divider(thickness: 3,color: Colors.deepPurple,),
            const SizedBox(height: 5,),
            const Text('Rango de fechas'),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    await _selectFechaInicio(context);
                    print(fechaInicio);
                  },
                  child: Text(fI),
                ),
                const SizedBox(width: 60,),
                ElevatedButton(
                  onPressed: () async{
                    await _selectFechaFin(context);
                    print(fechaFin);
                  },
                  child: Text(fF),
                ),
              ],
            ),
            const SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () async{
                await Navigator.pushNamed(context, '/verAsisFecha',arguments: {
                  "fechaInicio" : fechaInicio,
                  "fechaFin": fechaFin
                });
                setState(() {});
              },
              child: const Text('Consultar asistencias'),
            ),
            const SizedBox(height: 2,),
            TextField(controller: edificioController,decoration: const InputDecoration(hintText: 'Edificio',)),
            const SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () async{
                await Navigator.pushNamed(context, '/verAsigFecha',arguments: {
                  "fechaInicio" : fechaInicio,
                  "fechaFin": fechaFin,
                  "edificio": edificioController.text
                });
                setState(() {});
              },
              child: const Text('Consultar maestros por edificio'),
            ),
            const SizedBox(height: 5,),
            const Divider(thickness: 3,color: Colors.deepPurple,),
            const SizedBox(height: 5,),
            const Text('Consultar asistencias de un revisor'),
            TextField(controller: revisorController,decoration: const InputDecoration(hintText: 'Revisor'),),
            const SizedBox(height: 3,),
            ElevatedButton(onPressed: () async{
              await Navigator.pushNamed(context, '/verAsisRevisor',arguments: {
                "revisor" : revisorController.text
              });
              setState(() {});
            }, child: const Text('Consultar'))
          ],
        ),
      ),
    );
  }
}

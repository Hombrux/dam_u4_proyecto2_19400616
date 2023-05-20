import 'package:dam_u4_proyecto2_19400616/firestoredb.dart';
import 'package:flutter/material.dart';

class Asignacion extends StatefulWidget {
  const Asignacion({Key? key}) : super(key: key);

  @override
  State<Asignacion> createState() => _AsignacionState();
}

class _AsignacionState extends State<Asignacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asignaciones'),centerTitle: true,),
      body: FutureBuilder(
          future: getAsignacion(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.request_page),
                      title: Text(snapshot.data?[index]['materia'] + " - " + snapshot.data?[index]['docente']),
                      subtitle: Text(snapshot.data?[index]['salon'] + " - " + snapshot.data?[index]['horario']),
                      trailing: Text(snapshot.data?[index]['edificio']),
                      onTap: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('¿Que desea hacer con la asignacion ${snapshot.data?[index]['salon']}?'),
                            actions: [
                              TextButton(
                                child: const Text('Eliminar'),
                                onPressed: () {
                                  showDialog(context: context, builder: (BuildContext context){
                                    return AlertDialog(title: Text('¿Esta seguro?'),
                                      actions: [
                                        TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Cancelar')),
                                        TextButton(onPressed: (){
                                          eliminarAsignacion(snapshot.data?[index]['aid']);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          setState(() {});
                                        }, child: const Text('Eliminar'))
                                      ],);
                                  });
                                },
                              ),
                              TextButton(
                                child: const Text('Actualizar'),
                                onPressed: () async{
                                  await Navigator.pushNamed(context,'/actualizarA',arguments:{
                                    "salon": snapshot.data?[index]['salon'],
                                    "edificio" : snapshot.data?[index]['edificio'],
                                    "horario": snapshot.data?[index]['horario'],
                                    "docente": snapshot.data?[index]['docente'],
                                    "materia" : snapshot.data?[index]['materia'],
                                    "aid":snapshot.data?[index]['aid']
                                  });
                                  setState(() {});
                                },
                              ),
                              TextButton(
                                child: const Text('Ver asistencias'),
                                onPressed: () async{
                                  await Navigator.pushNamed(context, '/verAsist',arguments: {
                                    "aid":snapshot.data?[index]['aid'],
                                    "docente":snapshot.data?[index]['docente'],
                                    "salon":snapshot.data?[index]['salon'],
                                    "horario":snapshot.data?[index]['horario'],
                                  });
                                },
                              ),
                            ],
                          );
                        });
                      },
                    );
                  }
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.pushNamed(context, '/insertarA');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}

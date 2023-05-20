import 'package:dam_u4_proyecto2_19400616/firestoredb.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BusquedaAsistenciaDocente extends StatefulWidget {
  const BusquedaAsistenciaDocente({Key? key}) : super(key: key);

  @override
  State<BusquedaAsistenciaDocente> createState() => _BusquedaAsistenciaDocenteState();
}

class _BusquedaAsistenciaDocenteState extends State<BusquedaAsistenciaDocente> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es');
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text('Asistencias de ${arguments['docente']}',),centerTitle: true,),
      body: FutureBuilder(
          future: getAsistenciasDocente(arguments['docente']),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: const Icon(Icons.find_in_page_sharp),
                      title: Text(
                        DateFormat("dd MMMM yyyy, HH:mm:ss",Intl.defaultLocale = 'es').format(snapshot.data?[index]['fechahora'].toDate()),
                      ),
                      subtitle: Text(snapshot.data?[index]['revisor']),
                    );
                  }
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),);
  }
}

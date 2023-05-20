import 'package:dam_u4_proyecto2_19400616/firestoredb.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BuscarAsistenciaRevisor extends StatefulWidget {
  const BuscarAsistenciaRevisor({Key? key}) : super(key: key);

  @override
  State<BuscarAsistenciaRevisor> createState() => _BuscarAsistenciaRevisorState();
}

class _BuscarAsistenciaRevisorState extends State<BuscarAsistenciaRevisor> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es');
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text('Asistencias de ${arguments['revisor']}',),centerTitle: true,),
      body: FutureBuilder(
          future: getAsistenciasRevisor(arguments['revisor']),
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

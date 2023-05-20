import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firestoredb.dart';
import 'package:intl/intl.dart';

class VerAsistencias extends StatefulWidget {
  const VerAsistencias({Key? key}) : super(key: key);

  @override
  State<VerAsistencias> createState() => _VerAsistenciasState();
}

class _VerAsistenciasState extends State<VerAsistencias> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es');
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text('Asistencias de ${arguments['docente']} en ${arguments['salon']} a la(s) ${arguments['horario']}',),centerTitle: true,),
      body: FutureBuilder(
          future: getAsistencias(arguments['aid']),
          builder: (context,snapshot){
            if(snapshot.hasData) {
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
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.pushNamed(context, '/insertarAsist',arguments: {
            "aid" : arguments['aid']
          });
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

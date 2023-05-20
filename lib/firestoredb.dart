import 'package:cloud_firestore/cloud_firestore.dart';
FirebaseFirestore db = FirebaseFirestore.instance;

//CRUD de asignacion
Future<List> getAsignacion() async{
  List asignaciones = [];
  CollectionReference coleccionAsig = db.collection('asignacion');
  QuerySnapshot queryAsig = await coleccionAsig.get();
  queryAsig.docs.forEach((doc) {
    final Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
    final asignacion = {
      "salon" : data['salon'],
      "edificio" : data['edificio'],
      "horario" : data['horario'],
      "docente": data['docente'],
      "materia" : data['materia'],
      "aid" : doc.id
    };
    asignaciones.add(asignacion);
  });
  return asignaciones;
}

Future<void> insertarAsignacion(Map<String, dynamic> asig) async{
  await db.collection('asignacion').add(asig);
}
Future<void> actualizarAsignacion(String aid,Map<String, dynamic> asig) async{
  await db.collection('asignacion').doc(aid).update(asig);
}
Future<void> eliminarAsignacion(String aid) async{
  await db.collection('asignacion').doc(aid).delete();
}

//CRUD de asistencias
Future<List> getAsistencias(String aid) async{
  List asistencias = [];
  CollectionReference coleccionAsistencias = db.collection('asignacion').doc(aid).collection('asistencia');
  QuerySnapshot queryAsistencia = await coleccionAsistencias.get();
  queryAsistencia.docs.forEach((doc) {
    final Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
    final asistencia = {
      "fechahora": data['fechahora'],
      "revisor": data['revisor'],
      "asid":doc.id
    };
    asistencias.add(asistencia);
  });
  return asistencias;
}

Future<void> insertarAsistencia(String aid,Map<String, dynamic> asist) async{
  await db.collection('asignacion').doc(aid).collection('asistencia').add(asist);
}

//Consultas
Future<List> getAsistenciasDocente(String docente) async{
  List asistencias = [];
  QuerySnapshot queryAsigDocente = await db.collection('asignacion').where('docente',isEqualTo: docente).get();
  queryAsigDocente.docs.forEach((docAsig) async{
    QuerySnapshot queryAsisDocente = await db.collection('asignacion').doc(docAsig.id).collection('asistencia').get();
    queryAsisDocente.docs.forEach((docAsis){
      final Map<String,dynamic> data = docAsis.data() as Map<String,dynamic>;
      Map<String,dynamic> asistencia = {
        "fechahora": data['fechahora'],
        "revisor": data['revisor']
      };
      asistencias.add(asistencia);
    });
  });
  await Future.delayed(const Duration(seconds: 1));
  return asistencias;
}

Future<List> getAsistenciasRevisor(String revisor) async{
  List asistencias = [];
  QuerySnapshot queryAsigDocente = await db.collectionGroup('asistencia').where('revisor',isEqualTo: revisor).get();
  queryAsigDocente.docs.forEach((doc) {
      final Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
      Map<String,dynamic> asistencia = {
        "fechahora": data['fechahora'],
        "revisor": data['revisor']
      };
      asistencias.add(asistencia);
  });
  await Future.delayed(const Duration(seconds: 1));
  return asistencias;
}

Future<List> getAsistenciasFecha(DateTime fechaInicio, DateTime fechaFin) async{
  List asistencias = [];
  QuerySnapshot queryAsigDocente = await db.collectionGroup('asistencia').where('fechahora',isGreaterThan: fechaInicio).where('fechahora',isLessThan: fechaFin).get();
  queryAsigDocente.docs.forEach((doc) {
    final Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
    Map<String,dynamic> asistencia = {
      "fechahora": data['fechahora'],
      "revisor": data['revisor']
    };
    asistencias.add(asistencia);
  });
  await Future.delayed(const Duration(seconds: 1));
  return asistencias;
}

Future<List> getAsistenciasEdificio(DateTime fechaInicio, DateTime fechaFin,String edificio) async{
  List asignaciones = [];
  QuerySnapshot queryAsigDocente = await db.collectionGroup('asistencia').where('fechahora',isGreaterThan: fechaInicio).where('fechahora',isLessThan: fechaFin).get();
  queryAsigDocente.docs.forEach((doc) {
    DocumentReference asigDocente = doc.reference.parent.parent as DocumentReference<Object?>;
    asigDocente.get().then((docAsig) {
      final Map<String,dynamic> data = docAsig.data() as Map<String,dynamic>;
      final asignacion = {
        "salon" : data['salon'],
        "edificio" : data['edificio'],
        "horario" : data['horario'],
        "docente": data['docente'],
        "materia" : data['materia'],
        "aid" : doc.id
      };
      if(data['edificio'] == edificio){
        asignaciones.add(asignacion);
      }
    });
  });
  await Future.delayed(const Duration(seconds: 1));
  return asignaciones;
}

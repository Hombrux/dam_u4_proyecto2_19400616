import 'package:dam_u4_proyecto2_19400616/Busquedas/asignacionesfechas.dart';
import 'package:dam_u4_proyecto2_19400616/Busquedas/asistenciasfechas.dart';
import 'package:dam_u4_proyecto2_19400616/Busquedas/asistenciasrevisor.dart';
import 'package:dam_u4_proyecto2_19400616/CRUD/actualizarAsignacion.dart';
import 'package:dam_u4_proyecto2_19400616/CRUD/insertarAsignacion.dart';
import 'package:dam_u4_proyecto2_19400616/CRUD/insertarAsistencia.dart';
import 'package:dam_u4_proyecto2_19400616/principal.dart';
import 'package:dam_u4_proyecto2_19400616/verasistencias.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Busquedas/asistenciasdocente.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        '/' : (context)=> Principal(),
        '/insertarA' : (context) => InsertarAsignacion(),
        '/actualizarA' : (context) => ActualizarAsignacion(),
        '/verAsist' : (context) => VerAsistencias(),
        '/insertarAsist': (context) => InsertarAsistencia(),
        '/verAsisDocente':(context) => BusquedaAsistenciaDocente(),
        '/verAsisRevisor': (context) => BuscarAsistenciaRevisor(),
        '/verAsisFecha': (context) => BuscarAsistenciaFechas(),
        '/verAsigFecha': (context) => BuscarAsignacionesFecha()
      },
    );
  }
}

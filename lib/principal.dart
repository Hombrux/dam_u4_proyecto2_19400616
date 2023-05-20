import 'package:dam_u4_proyecto2_19400616/asignacion.dart';
import 'package:dam_u4_proyecto2_19400616/busquedas.dart';
import 'package:flutter/material.dart';
class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Asignacion(),
    Busquedas()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Maestros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Busqueda',
          ),
        ],
      ),
    );
  }
}

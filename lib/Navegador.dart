import'package:flutter/material.dart';
import 'vistas/calculadora.dart';
import 'Contador.dart';

class Navegador extends StatefulWidget{
    Navegador({super.key});

    State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador>{

  int _indice = 0;
  final _cuerpo=[
    const Calculadora(
      titulo: "Calculadora",
    ),
    const Contador(
          title: "Contador",
    ),
    ];
  void _onItemTapped(int index) {
    setState(() {
      _indice = index;
    });
  }

  @override
  Widget build(BuildContext context){
      return Scaffold(
        body: _cuerpo[_indice],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: "Calculadora"),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessible),
                label: "Contador")
          ],
          currentIndex: _indice,
          onTap: _onItemTapped,
        ),
      );
    }
}
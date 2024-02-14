import'package:flutter/material.dart';
import 'vistas/calculadora.dart';
import 'Contador.dart';
import 'vistas/Home.dart';
import 'vistas/Texto.dart';

class Navegador extends StatefulWidget{
    Navegador({super.key});

    State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador>{

  int _indice = 0;
  final _cuerpo=[
    const Home(
      titulo: "Home",
    ),

    const Contador(
          title: "Contador",
    ),
    const Calculadora(
      titulo: "Calculadora",
    ),
    const Texto(
        titulo: "Texto",
    )
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
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: "Contador"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: "Calculadora"),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc),
                label: "Texto"),
          ],
          currentIndex: _indice,
          onTap: _onItemTapped,
        ),
      );
    }
}
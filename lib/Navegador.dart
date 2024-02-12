import'package:flutter/material.dart';
import 'vistas/calculadora.dart';

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
    Text(
      "Soy el cuerpo 2",
      style: TextStyle(fontSize: 40),
    )];

  @override
  Widget build(BuildContext context){
      return Scaffold(
        body: _cuerpo[_indice],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) =>{
            _indice = value
          },
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: "Calculadora"),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessible),
                label: "Calculadora")
          ],
        ),
      );
    }
}
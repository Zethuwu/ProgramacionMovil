import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.titulo});

  final String titulo;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _trab="0";

  void _borraTodo(){
    setState(() {
      _trab="0";
    });
  }

  void _agregaNumero(String n){
    setState(() {
      _trab=_trab + n;
    });
  }

  void _eliminarUno(){
    setState(() {
      if(_trab == "" ){
        _trab = "0";
      }else{
        String tem = "";
        for(int i=0;i<_trab.length -1;i++){
          tem += _trab[i];
        }
        _trab = tem;
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.titulo),
      ),
      body: Center(
        child: Container(
          height: 337,
          width: 224,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                      Radius.circular(
                        8,
                      )
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$_trab",
                      style: TextStyle(fontSize: 40),

                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: (){
                      _borraTodo();
                    },
                    child: const Text(
                      "CE",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                        _eliminarUno();
                    },
                    child: const Text(
                      "<-",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){

                    },
                    child: const Text(
                      "%",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){

                    },
                    child: const Text(
                      "/",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: (){
                      _agregaNumero("7");
                    },
                    child: const Text(
                      "7",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      _agregaNumero("8");
                    },
                    child: const Text(
                      "8",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      _agregaNumero("9");
                    },
                    child: const Text(
                      "9",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){

                    },
                    child: const Text(
                      "*",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: (){
                      _agregaNumero("4");
                    },
                    child: const Text(
                      "4",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      _agregaNumero("5");
                    },
                    child: const Text(
                      "5",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      _agregaNumero("6");
                    },
                    child: const Text(
                      "6",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){

                    },
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: (){
                      _agregaNumero("1");
                    },
                    child: const Text(
                      "1",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      _agregaNumero("2");
                    },
                    child: const Text(
                      "2",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      _agregaNumero("3");
                    },
                    child: const Text(
                      "3",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){

                    },
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 112,
                    child: FloatingActionButton(
                      onPressed: (){
                        _agregaNumero("0");
                      },
                      child: const Text(
                        "0",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){

                    },
                    child: const Text(
                      ".",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){

                    },
                    child: const Text(
                      "=",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
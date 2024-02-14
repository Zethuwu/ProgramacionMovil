import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Texto extends StatefulWidget {
  const Texto({super.key, required this.titulo});

  final String titulo;

  @override
  State<Texto> createState() => _TextoState();
}
class _TextoState extends State<Texto>{

  String _trab="0";

  void _agregaNumero(){
    setState(() {
      print(_trab);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.titulo),
      ),
      body:Center(

        child: Column(
          children: <Widget>[
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username',

                ),
              ),
            ),
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     shadowColor: const Color.fromARGB(150, 195, 132, 118)
                   ),
                   onPressed: () {
                     _trab = toString();
                     _agregaNumero();
                   },
                   child: const Text( "Enviar"),
                 ),

            ),
          ],
        ),

          ),
        );

}


}

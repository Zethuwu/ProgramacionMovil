import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Texto extends StatefulWidget {
  const Texto({super.key, required this.titulo});

  final String titulo;

  @override
  State<Texto> createState() => _TextoState();
}
class MyModel extends ChangeNotifier {
  String _inputValue = '';

  String get inputValue => _inputValue;

  void setInputValue(String value) {
    _inputValue = value;
    notifyListeners();
  }
}

class _TextoState extends State<Texto>{
  String _valorFinal = "";
  String _inputValue = '';

  void _agregaNumero(){
    setState(() {
      print(_inputValue);
    });
  }
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context);
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
                onChanged: (value){
                  setState(() {
                    myModel.setInputValue(value);
                  });
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username',

                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Muestra el valor actual de la variable
            Text('Valor ingresado: ${myModel.inputValue}'),
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     shadowColor: const Color.fromARGB(150, 195, 132, 118)
                   ),
                   onPressed: () {
                      _valorFinal = _inputValue;
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

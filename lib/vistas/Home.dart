import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'Texto.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.titulo});

  final String titulo;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.titulo),
      ),
      body: Center(
         child: Consumer<MyModel>(
           builder: (context, myModel, _) => Text(
              'Bienvenido ${myModel.inputValue}',
                   style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }

}


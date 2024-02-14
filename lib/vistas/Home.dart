import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.titulo});

  final String titulo;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.titulo),
      ),
      body: const Center(
        child: Text(
          "Bienvenido",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
    throw UnimplementedError();
  }

}

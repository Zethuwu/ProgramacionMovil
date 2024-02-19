import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Geo extends StatefulWidget {
  const Geo({super.key, required this.titulo});

  final String titulo;

  @override
  State<Geo> createState() => _GeoState();
}

class _GeoState extends State<Geo> {
  String _latitud = '';
  String _longitud = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                  'Latitud: $_latitud',
                  style: const TextStyle(
                    fontSize: 30
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                  'Longitud: $_longitud',
                    style: const TextStyle(
                        fontSize: 30
                    ),
              ),
            ),
            GetLocationButton(this), // Pasar una referencia de _GeoState al constructor de GetLocationButton
          ],
        ),
      ),
    );
  }

  void _getLocation(BuildContext context) async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _latitud = position.latitude.toString();
      _longitud = position.longitude.toString();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Latitud: ${position.latitude}, Longitud: ${position.longitude}',
        ),
      ),
    );
  }
}

class GetLocationButton extends StatelessWidget {
  final _GeoState geoState; // Mantener una referencia a _GeoState

    const GetLocationButton(this.geoState, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        geoState._getLocation(context); // Llamar al método _getLocation de _GeoState
      },
      child: const Text('Obtener Ubicación'),
    );
  }
}

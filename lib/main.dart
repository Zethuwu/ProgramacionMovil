import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importa las opciones de configuración de Firebase
import 'package:firebase_database/firebase_database.dart';
import 'SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa Firebase con las opciones de configuración
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "",
      authDomain: "PUV3QW95piezUkRUhUb7EkQFElx2",
      databaseURL: "https://curso-c7d1a-default-rtdb.firebaseio.com/",
      projectId: "curso-c7d1a",
      storageBucket: "com.fes_aragon.curso",
      messagingSenderId: "219416366711",
      appId: "aragon.unam.mx",
    ),
  );

  // DatabaseReference para acceder a la base de datos
  DatabaseReference eventsRef = FirebaseDatabase.instance.reference().child('events');

  runApp(
    MaterialApp(
      home: SplashScreen(),
    ),
  );
}




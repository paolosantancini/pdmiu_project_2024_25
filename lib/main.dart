/*
Paolo Santancini - matr. 334128
Progetto PDMIU 2024/25

Simulatore di login con logs
*/

//import 'package:flutter/cupertino.dart'; // iOS layout
import 'package:flutter/material.dart';
import 'widgets/login.dart';
import 'widgets/mostra.dart';
import 'models/lista.dart';
import 'widgets/esporta.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progetto PDMIU 2024/25 - Emulatore di Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int scelta = 0;
  var mialista = Lista();

  static final List<Widget> _widgetOptions = <Widget>[
    LoginPage(),
    Mostralog(),
    Esporta(),
  ];

  void __selezione(int index) {
    setState(() {
      scelta = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Lista singleton inizializzata con testata
    mialista.inserisciElemento("E-mail", "Password", "UTC_Time");
  }

  @override
  void dispose() {
    super.dispose();
    mialista.cancella();
    // NO OP
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _widgetOptions.elementAt(scelta),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_array),
            label: 'Mostra login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_export),
            label: 'Esporta login',
          ),
        ],
        currentIndex: scelta,
        selectedItemColor: Colors.amber[800],
        onTap: __selezione,
      ),
    );
  }
}

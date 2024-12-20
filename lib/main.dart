/*
Paolo Santancini - matr. 334128
Progetto PDMIU 2024

Simulatore di login con logs
*/

import 'package:flutter/material.dart'; // Android layout
//import 'package:flutter/cupertino.dart'; // iOS layout
import 'models/log.dart';
import 'package:flutter_ntp/flutter_ntp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  // Definizione di variabili private (prefisso _)
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // NO OP
  }

  @override
  void dispose() {
    super.dispose();
    // NO OP
  }

  Future<void> getTime() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    DateTime ntpTime;

    try {
      //myTime = DateTime.now();
      ntpTime = await FlutterNTP.now();
    } catch (e) {
      ntpTime = DateTime.now();
    }

    setState(() {
      String currentTime = ntpTime.toLocal().toString();
      FileUtils().saveFile("$email;$password;$currentTime");
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        // Multi-child layout widgets
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                getTime();
              },
              child: const Text('Accedi'),
            ),
          ],
        ),
      ),
    );
  }
}

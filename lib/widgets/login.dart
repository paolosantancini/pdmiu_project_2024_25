import 'package:flutter/material.dart'; // Android layout
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pdmiu_project_2024_25/models/lista.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  // Definizione di variabili private (prefisso _)
  // final: valore noto in fase di runtime
  // const: valore noto in fase di compilazione (ottimizzazione)
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  DateTime? _ora;
  bool _caricando = false;
  final mialista = Lista();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // NO OP
  }

  // Rappresenta una funzione asincrona che potrebbe completarsi in futuro
  Future<void> getNtpTime() async {
    String email = _emailController.text;
    String pwd = _passwordController.text;

    setState(() {
      _caricando = true;
    });
    try {
      // Richiesta REST API
      final risposta = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/Etc/UTC'));

      if (risposta.statusCode == 200) {
        // Lettura della risposta REST in formato json
        final data = json.decode(risposta.body);
        setState(() {
          // Acquisizione del valore dell'attributo "utc_datetime" dal json
          _ora = DateTime.parse(data['utc_datetime']);
        });
      } else {
        debugPrint('Errore nella richiesta: ${risposta.statusCode}');
      }
    } catch (e) {
      // Intrappolamento di eventuale errore
      debugPrint("Errore nel recupero dell'ora NTP: $e");
    } finally {
      setState(() {
        _caricando = false;
        //FileUtils().saveFile(message);
        mialista.inserisciElemento(
            email, pwd, _ora.toString() == "null" ? "---" : _ora.toString());
        //Lista().esportaCSV(_dataList);
        _emailController.clear();
        _passwordController.clear();
      });
    }
    _showToast(
        'Login registrati ${mialista.restituisciContatore().toString()}');
  }

  // metodo per la rappresentazione del contatore
  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        // Multi-child layout widgets
        child: _caricando
            ? //const CircularProgressIndicator()
            Center(
                child: SpinKitCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              )
            : Column(
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
                      getNtpTime();
                    },
                    child: const Text('Accedi'),
                  ),
                ],
              ),
      ),
    );
  }
}

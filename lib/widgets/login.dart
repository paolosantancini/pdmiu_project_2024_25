import 'package:flutter/material.dart'; // Android layout
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pdmiu_project_2024_25/widgets/toast.dart';
import 'package:pdmiu_project_2024_25/models/lista.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  // Definizione di variabili private (prefisso _)
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  DateTime? _currentNtpTime;
  bool _isLoading = false;
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

  Future<void> getNtpTime() async {
    // Applcazione di condizionale ternario
    String email = _emailController.text == "" ? "---" : _emailController.text;
    String pwd =
        _passwordController.text == "" ? "---" : _passwordController.text;

    setState(() {
      _isLoading = true;
    });
    try {
      // Richiesta REST API
      final response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/Etc/UTC'));

      if (response.statusCode == 200) {
        // Lettura della risposta REST in formato json
        final data = json.decode(response.body);
        setState(() {
          // Acquisizione del valore dell'attributo "utc_datetime" dal json
          _currentNtpTime = DateTime.parse(data['utc_datetime']);
        });
      } else {
        debugPrint('Errore nella richiesta: ${response.statusCode}');
      }
    } catch (e) {
      // Intrappolamento di eventuale errore
      debugPrint("Errore nel recupero dell'ora NTP: $e");
    } finally {
      setState(() {
        _isLoading = false;
        //FileUtils().saveFile(message);
        mialista.inserisciElemento(
            email,
            pwd,
            _currentNtpTime.toString() == "null"
                ? "---"
                : _currentNtpTime.toString());
        //Lista().esportaCSV(_dataList);
        _emailController.clear();
        _passwordController.clear();
      });
    }
    Toast('Login registrato ${mialista.restituisciContatore().toString()}');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        // Multi-child layout widgets
        child: _isLoading
            ? const CircularProgressIndicator()
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

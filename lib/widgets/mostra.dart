import 'package:flutter/material.dart';
import 'package:pdmiu_project_2024_25/models/lista.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Mostralog extends StatefulWidget {
  const Mostralog({super.key});

  @override
  State<Mostralog> createState() => _Mostralog();
}

class _Mostralog extends State<Mostralog> {
  final mialista = Lista();
  List<List<String>> _dati = [];
  bool _caricando = true;

  @override
  void initState() {
    super.initState();
    _caricaDatiCSV();
  }

  Future<void> _caricaDatiCSV() async {
    final List<List<String>> items = mialista.restituisciLista();
    setState(() {
      _dati = items;
      _caricando = false;
    });
  }

  Color _getColor(miariga) {
    return (miariga % 2) == 0 ? Colors.grey : Colors.blueGrey;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
      appBar: AppBar(),
      body: _caricando
          ? Center(
              child: SpinKitCircle(
                color: Colors.blue,
                size: 50.0,
              ),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 10, // pixel
              ),
              // numero di righe per numero di colonne
              itemCount: _dati.length * _dati[0].length,
              itemBuilder: (context, indice) {
                int riga = indice ~/ _dati[0].length;
                int colonna = indice % _dati[0].length;
                return Container(
                  margin: EdgeInsets.all(1.0),
                  // _ora.toString() == "null" ? "---" : _ora.toString())
                  color: riga == 0 ? Colors.black : _getColor(riga),
                  child: Center(
                      child: Text(
                    _dati[riga][colonna],
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
                );
              }),
    );
  }
}

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
  List<List<String>> _data = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadCsvData();
  }

  Future<void> _loadCsvData() async {
    final List<List<String>> items = mialista.restituisciLista();
    setState(() {
      _data = items;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
      appBar: AppBar(),
      body: _loading
          ? Center(
              child: SpinKitCircle(
                color: Colors.blue,
                size: 50.0,
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                // Header
                columns: _data[0]
                    .map((header) => DataColumn(label: Text(header.toString())))
                    .toList(),
                // Dati (log degli accessi)
                rows: _data
                    .sublist(1)
                    .map((row) => DataRow(
                          cells: row
                              .map((cell) => DataCell(Text(cell.toString())))
                              .toList(),
                        ))
                    .toList(),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pdmiu_project_2024_25/models/lista.dart';

class Esporta extends StatelessWidget {
  Esporta({super.key});
  final mialista = Lista();

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    mialista.esportaCSV();
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

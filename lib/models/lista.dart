import 'package:csv/csv.dart';
import 'package:file_saver/file_saver.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

// Classe per la gestione della lista dei log
class Lista {
  final List<List<String>> dataList = [];

  // Costruttore singleton
  Lista._construttorePrivato();

  // The single instance of this class
  static final Lista _instance = Lista._construttorePrivato();

  // Factory constructor to return the same instance
  factory Lista() {
    return _instance;
  }

// Inserisce valori alla lista di dati in memoria
// L'eventuale passaggio parametrico di oggetti in flutter
// prevede già la referenza e non la copia
  void inserisciElemento(String email, String pwd, String time) {
    dataList.add([email, pwd, time]);
  }

// Esporta il conenuto della lista
// su un file di tipo csv
  Future<void> esportaCSV() async {
    String csvData = const ListToCsvConverter().convert(dataList);
    Uint8List bytes = Uint8List.fromList(csvData.codeUnits);
    await FileSaver.instance.saveFile(
      "log",
      bytes,
      "",
      mimeType: MimeType.CSV,
    );
  }

  List<List<String>> restituisciLista() {
    return dataList;
  }

  // Ritorna il numero di elementi nella lista
  // meno "header"
  int restituisciContatore() {
    return (dataList.length - 1);
  }

// Cancella il contenuto della lista
  void cancella() {
    dataList.clear();
  }
}

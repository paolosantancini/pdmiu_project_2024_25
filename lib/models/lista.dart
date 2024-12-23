import 'package:csv/csv.dart';
import 'package:file_saver/file_saver.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

// Classe per la gestione della lista dei log
class Lista {
  final List<List<String>> listaDati = [];

// Pattern Singleton
  Lista._construttorePrivato();

  // Singola istanza
  static final Lista _istanza = Lista._construttorePrivato();

  // Costruttore "Factory": ritorna la stessa istanza
  factory Lista() {
    return _istanza;
  }

// Inserisce valori alla lista di dati in memoria
// L'eventuale passaggio parametrico di oggetti in flutter
// prevede già la referenza e non la copia
  void inserisciElemento(String email, String pwd, String time) {
    if ((email.isNotEmpty) && (pwd.isNotEmpty)) {
      if (restituisciContatore() < 0) {
        listaDati.add([email, pwd, time]);
      } else {
        listaDati.add([email, _generaHash(pwd), time]);
      }
    }
  }

// Esporta il conenuto della lista
// su un file di tipo csv
  Future<void> esportaCSV() async {
    String csvData = const ListToCsvConverter().convert(listaDati);
    Uint8List bytes = Uint8List.fromList(csvData.codeUnits);
    await FileSaver.instance.saveFile(
      "log",
      bytes,
      "",
      mimeType: MimeType.CSV,
    );
  }

  List<List<String>> restituisciLista() {
    return listaDati;
  }

  // Ritorna il numero di elementi nella lista
  // meno "header"
  int restituisciContatore() {
    return (listaDati.length - 1);
  }

// Cancella il contenuto della lista
  void cancella() {
    listaDati.clear();
  }

  String _generaHash(String pwdtemp) {
    final bytes =
        utf8.encode(pwdtemp); // Convert the password to a list of bytes
    final hash = sha256.convert(bytes); // Generate the SHA-256 hash

    return hash.toString();
  }
}

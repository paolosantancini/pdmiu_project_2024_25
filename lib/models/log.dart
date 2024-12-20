import 'package:file_saver/file_saver.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

// Gestione del file di log
// Specifico per browser
class FileUtils {
  // Costruttore
  FileUtils();

// Salvataggio del file all'interno della cartella download
  Future<void> saveFile(String text) async {
    Uint8List bytes = Uint8List.fromList(text.codeUnits);
    await FileSaver.instance.saveFile(
      "log",
      bytes,
      "",
      mimeType: MimeType.CSV,
    );
  }
}

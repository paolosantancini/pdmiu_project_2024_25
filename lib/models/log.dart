import 'dart:io';
import 'package:path_provider/path_provider.dart';

// Gestione del file di log
class FileUtils {
  // Costruttore
  FileUtils();

  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/log.csv';
  }

  Future<void> checkAndCreateFile() async {
    final path = await _getFilePath();
    final file = File(path);

    if (await file.exists()) {
      // NO OP
    } else {
      await file.create();
    }
  }

  void ScriviLog() {}
}

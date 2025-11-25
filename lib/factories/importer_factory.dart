import 'package:museman/interfaces/importer_interface.dart';

enum ImporterTypes {
  sqlite3, csv;
}

class ImporterFactory {
  IImporter makeImporter(ImporterTypes type, Map<String, String> data) {
    throw UnimplementedError();
  }
}
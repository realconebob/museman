import 'package:museman/interfaces/exporter_interface.dart';

enum ExporterTypes {
  sqlite3, filesystem;
}

class ExporterFactory {
  IExporter makeExporter(ExporterTypes type, Map<String, String> data) {
    throw UnimplementedError();
  }
}
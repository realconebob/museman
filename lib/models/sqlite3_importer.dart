import 'package:museman/interfaces/importer_interface.dart';
import 'package:museman/factories/datastore_factory.dart';

class Sqlite3Importer implements IImporter {
  String _target;

  Sqlite3Importer(this._target);

  @override
  importData(DatastoreFactory dsfactory, String target) {
    // TODO: implement importData
    throw UnimplementedError();
  }

  set setTarget(String path) {}

  String get getTarget => _target;

  Sqlite3Importer buildImporter(Map<String, String> data) {
    // TODO: implement importData
    throw UnimplementedError();
  }
}
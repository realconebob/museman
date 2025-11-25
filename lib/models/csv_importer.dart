import 'package:museman/interfaces/importer_interface.dart';
import 'package:museman/factories/datastore_factory.dart';

class CSVImporter implements IImporter {
  String _target;

  CSVImporter(this._target);

  @override
  importData(DatastoreFactory dsfactory, String target) {
    // TODO: implement importData
    throw UnimplementedError();
  }

  set setTarget(String path) {}
  String get getTarget => _target;

  IImporter buildImporter(Map<String, String> data) {
    throw UnimplementedError();
  }
}
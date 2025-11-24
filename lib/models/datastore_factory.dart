import 'package:museman/interfaces/datastore_interface.dart';

enum DatastoreTypes {
  sqlite3Datastore;
}

class DatastoreFactory {
  IDatastore makeDatastore(DatastoreTypes type, Map<String, String> data) => throw UnimplementedError();
  IDatastore makeDatastoreP(DatastoreTypes type, List<String> data) => throw UnimplementedError();
}
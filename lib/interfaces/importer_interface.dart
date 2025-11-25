import 'package:museman/factories/datastore_factory.dart';

abstract interface class IImporter {
  importData(DatastoreFactory dsfactory, String target);
}
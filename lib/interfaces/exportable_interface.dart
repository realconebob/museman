import 'package:museman/interfaces/exporter_interface.dart';

abstract interface class IExportable {
  void accept(IExporter exporter);
}
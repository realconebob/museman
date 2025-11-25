import 'package:museman/interfaces/exportable_interface.dart';
import 'package:museman/interfaces/exporter_interface.dart';
import 'package:museman/interfaces/song_interface.dart';

class StandardSong implements ISong, IExportable {
  @override set setPath(String path) {
    throw UnimplementedError();
  }

  @override set setName(String name) {
    throw UnimplementedError();
  }

  @override set setArtists(List<String> artists) {
    throw UnimplementedError();
  }

  @override String get getPath => throw UnimplementedError();
  @override String get getName => throw UnimplementedError();
  @override List<String> get getArtists => throw UnimplementedError();

  @override
  void accept(IExporter exporter) => throw UnimplementedError();
}
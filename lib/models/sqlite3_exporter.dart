import 'package:museman/interfaces/datastore_interface.dart';
import 'package:museman/interfaces/exporter_interface.dart';
import 'package:museman/interfaces/playlist_interface.dart';
import 'package:museman/interfaces/song_interface.dart';

class Sqlite3Exporter implements IExporter {
  String _target;

  Sqlite3Exporter(this._target);

  @override
  void exportDatastore(IDatastore datastore) {
    // TODO: implement exportDatastore
  }

  @override
  void exportPlaylist(IPlaylist playlist) {
    // TODO: implement exportPlaylist
  }

  @override
  void exportSong(ISong song) {
    // TODO: implement exportSong
  }

  set setTarget(String path) {}
  String get getTarget => _target;

  Sqlite3Exporter buildExporter(Map<String, String> data) {
    // TODO: implement buildExporter
    throw UnimplementedError();
  }

}
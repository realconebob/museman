import 'package:museman/interfaces/datastore_interface.dart';
import 'package:museman/interfaces/exporter_interface.dart';
import 'package:museman/interfaces/playlist_interface.dart';
import 'package:museman/interfaces/song_interface.dart';

class FilesystemExporter implements IExporter {
  String _rootdir;

  FilesystemExporter(this._rootdir);

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

  set setRoot(String root) {}
  String get getRoot => _rootdir;

  IExporter buildExporter(Map<String, String> data) {
    throw UnimplementedError();
  }
}
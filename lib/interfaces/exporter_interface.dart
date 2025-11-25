import 'package:museman/interfaces/datastore_interface.dart';
import 'package:museman/interfaces/playlist_interface.dart';
import 'package:museman/interfaces/song_interface.dart';

abstract interface class IExporter {
  void exportSong(ISong song);
  void exportPlaylist(IPlaylist playlist);
  void exportDatastore(IDatastore datastore);
}
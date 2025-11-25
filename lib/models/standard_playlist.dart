import 'dart:collection';

import 'package:museman/interfaces/exportable_interface.dart';
import 'package:museman/interfaces/exporter_interface.dart';
import 'package:museman/interfaces/playlist_interface.dart';
import 'package:museman/interfaces/song_interface.dart';

class StandardPlaylist implements IPlaylist, IExportable {
  @override
  set addSong(ISong song) {
    // TODO: implement addSong
  }

  @override
  set addSongs(List<ISong> songs) {
    // TODO: implement addSongs
  }

  @override
  void clearSongs() {
    // TODO: implement clearSongs
  }

  @override
  set delSong(ISong song) {
    // TODO: implement delSong
  }

  @override
  set delSongs(List<ISong> songs) {
    // TODO: implement delSongs
  }

  @override
  // TODO: implement getName
  String get getName => throw UnimplementedError();

  @override
  // TODO: implement getSongs
  SplayTreeMap<String, ISong> get getSongs => throw UnimplementedError();

  @override
  SplayTreeMap<String, ISong> getSongsByName(String name) {
    // TODO: implement getSongsByName
    throw UnimplementedError();
  }

  @override
  bool isSongInList(ISong song) {
    // TODO: implement isSongInList
    throw UnimplementedError();
  }

  @override
  set setName(String name) {
    // TODO: implement setName
  }

  @override
  set setSongs(List<ISong> songs) {
    // TODO: implement setSongs
  }

  @override
  void accept(IExporter exporter) {
    // TODO: implement accept
  }

}
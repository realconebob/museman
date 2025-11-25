import 'dart:collection';

import 'package:museman/interfaces/datastore_interface.dart';
import 'package:museman/interfaces/exportable_interface.dart';
import 'package:museman/interfaces/exporter_interface.dart';
import 'package:museman/interfaces/playlist_interface.dart';
import 'package:museman/interfaces/song_interface.dart';

class Sqlite3Datastore implements IDatastore, IExportable {
  @override
  set addPlaylist(IPlaylist playlist) {
    // TODO: implement addPlaylist
  }

  @override
  set addPlaylists(List<IPlaylist> playlists) {
    // TODO: implement addPlaylists
  }

  @override
  set addSong(ISong song) {
    // TODO: implement addSong
  }

  @override
  set addSongs(List<ISong> songs) {
    // TODO: implement addSongs
  }

  @override
  set delPlaylist(IPlaylist playlist) {
    // TODO: implement delPlaylist
  }

  @override
  set delPlaylists(List<IPlaylist> playlists) {
    // TODO: implement delPlaylists
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
  SplayTreeMap<String, IPlaylist> getPlaylists() {
    // TODO: implement getPlaylists
    throw UnimplementedError();
  }

  @override
  SplayTreeMap<String, IPlaylist> getPlaylistsByName(String name) {
    // TODO: implement getPlaylistsByName
    throw UnimplementedError();
  }

  @override
  SplayTreeMap<String, ISong> getSongs() {
    // TODO: implement getSongs
    throw UnimplementedError();
  }

  @override
  SplayTreeMap<String, ISong> getSongsByName(String name) {
    // TODO: implement getSongsByName
    throw UnimplementedError();
  }

  @override
  set setPlaylists(List<IPlaylist> playlists) {
    // TODO: implement setPlaylists
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
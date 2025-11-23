import 'dart:collection';

import 'package:museman/interfaces/song_interface.dart';

abstract interface class IPlaylist {
  String get getName;
  SplayTreeMap<String, ISong> get getSongs;
  SplayTreeMap<String, ISong> getSongsByName(String name);
  bool isSongInList(ISong song);

  set setName(String name);
  set addSong(ISong song);
  set delSong(ISong song);
  set addSongs(List<ISong> songs);
  set delSongs(List<ISong> songs);
  set setSongs(List<ISong> songs);
  void clearSongs();
}
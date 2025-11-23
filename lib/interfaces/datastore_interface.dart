import 'dart:collection';

import 'package:museman/interfaces/playlist_interface.dart';
import 'package:museman/interfaces/song_interface.dart';

abstract interface class IDatastore {
  SplayTreeMap<String, IPlaylist> getPlaylists();
  SplayTreeMap<String, IPlaylist> getPlaylistsByName(String name);
  SplayTreeMap<String, ISong> getSongs();
  SplayTreeMap<String, ISong> getSongsByName(String name);

  set addPlaylist(IPlaylist playlist);
  set addPlaylists(List<IPlaylist> playlists);
  set delPlaylist(IPlaylist playlist);
  set delPlaylists(List<IPlaylist> playlists);
  set setPlaylists(List<IPlaylist> playlists);

  set addSong(ISong song);
  set delSong(ISong song);
  set addSongs(List<ISong> songs);
  set delSongs(List<ISong> songs);
  set setSongs(List<ISong> songs);
}
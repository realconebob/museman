import 'package:museman/interfaces/playlist_interface.dart';

enum PlaylistTypes {
  standardPlaylist;
}

class PlaylistFactory {
  IPlaylist makePlaylist(PlaylistTypes type, Map<String, String> data) => throw UnimplementedError();
  IPlaylist makePlaylistP(PlaylistTypes type, List<String> data) => throw UnimplementedError();
}
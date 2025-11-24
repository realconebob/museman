import 'package:museman/interfaces/song_interface.dart';

enum SongTypes {
  standardSong;
}

class SongFactory {
  ISong makeSong(SongTypes type, Map<String, String> data) => throw UnimplementedError();
  ISong makeSongP(SongTypes type, List<String> data) => throw UnimplementedError();
}
abstract interface class ISong {
  set setPath(String path);
  set setName(String name);
  set setArtists(List<String> artists);

  String get getPath;
  String get getName;
  List<String> get getArtists;
}
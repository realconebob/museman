import 'dart:collection';
import 'dart:io';
import 'shared.dart';

/// Exception for when encountering an insane / malformed path
class InsanePathException implements Exception {
  final String msg;
  const InsanePathException([this.msg = '']);
  @override String toString() {return "<InsanePathException> $msg";}
}

/// Scan mode modifiers. See FileScanner::scan for more details
enum Scanmode {
  scanSet,
  scanAdd,
  scanDel
}

/// OS agnostic interface for filesystem scanners
abstract interface class FileScanner {
  Future<void> setRoots(Set<Directory> roots);
  Future<void> setPaths(Set<String> paths);

  Future<void> addRoots(Set<Directory> roots);
  Future<void> addPaths(Set<String> paths);

  void delRoots(Set<Directory> roots);
  void delPaths(Set<String> paths);

  void clearStore();

  Set<Directory> get getRoots;
  Set<String> get getPaths;

  /// Scan the list of root paths for files. Specify [roots] to scan a set of roots apart from the stored list.
  /// Specify [roots] and [set] to scan [roots] and do an operation on the stored list. Note: This does not modify and then scan,
  /// it scans the specified list of roots in [roots], and then modifies the stored list
  // Future<Set<FileSystemEntity>?> scan({Set<Directory>? roots, Scanmode? set});
}

class GenericFScanner implements FileScanner {
  final Set<Directory> _rootDirs;

  GenericFScanner({Set<Directory>? dirs}): _rootDirs = HashSet() {
    if(dirs != null) {_rootDirs.addAll(dirs);}
  }

  Future<Set<String>?> _validateRootPaths(Set<String> paths, {Set<Directory>? store}) async {
    if(paths.isEmpty) {throw InvalidArgumentException("Given empty paths set");}
    Set<String> res = HashSet();
    bool addToStore = (store != null);

    for(String cur in paths) {
      Directory temp = Directory(cur);
      if(!await temp.exists()) { // If temp does not exist, it is not valid, so add it to the invalid set
        res.add(cur);
        continue;
      }

      if(addToStore) {store.add(temp);} // If temp does exist, it is valid; and if [valid] exists, add it to the user provided set
    }

    return (res.isEmpty) ? null : res;
  }

  Future<void> _xValidateRootPaths(Set<String> paths, {Set<Directory>? store}) async {
    Set<String>? invalidPaths = await _validateRootPaths(paths, store: store);
    if(invalidPaths != null) throw InsanePathException("Insane paths: $invalidPaths");
    return;
  }

  Future<Set<Directory>?> _validateRootDirs(Set<Directory> roots, {Set<Directory>? store}) async {
    if(roots.isEmpty) throw InvalidArgumentException("Given empty roots set");
    Set<Directory> res = HashSet();
    bool addToStore = (store != null);

    for(Directory cur in roots) {
      if(!await cur.exists()) {
        res.add(cur);
        continue;
      }

      if(addToStore) {store.add(cur);}
    }

    return (res.isEmpty) ? null : res;
  }

  Future<void> _xValidateRootDirs(Set<Directory> roots, {Set<Directory>? store}) async {
    Set<Directory>? invalidDirs = await _validateRootDirs(roots, store: store);
    if(invalidDirs != null) throw InsanePathException("Nonexistent paths: $invalidDirs");
    return;
  }

  @override
  Future<void> addPaths(Set<String> paths) async {
    await _xValidateRootPaths(paths, store: _rootDirs);
    return;
  }



  @override
  Future<void> addRoots(Set<Directory> roots) async {
    await _xValidateRootDirs(roots, store: _rootDirs);
    return;
  }

  @override
  void clearStore() {
    _rootDirs.clear();
    return;
  }

  @override
  void delPaths(Set<String> paths) async {
    Set<Directory> toDel = HashSet();
    await _xValidateRootPaths(paths, store: toDel);
    _rootDirs.removeAll(toDel);
  }

  @override
  void delRoots(Set<Directory> roots) async {
    Set<Directory> toDel = HashSet();
    await _xValidateRootDirs(roots, store: toDel);
    _rootDirs.removeAll(toDel);
  }

  @override
  Set<String> get getPaths {
    Set<String> paths = HashSet();
    for(Directory cur in _rootDirs) {
      paths.add(cur.path);
    }

    return paths;
  }

  @override
  Set<Directory> get getRoots {return _rootDirs;}

  @override
  Future<void> setPaths(Set<String> paths) async {
    clearStore();
    await addPaths(paths);
    return;
  }

  @override
  Future<void> setRoots(Set<Directory> roots) async {
    clearStore();
    await addRoots(roots);
    return;
  }


  
}
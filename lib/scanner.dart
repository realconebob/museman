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
  /// Set a new set of root paths for scanning
  set setRoots(Set<Directory> roots);
  /// Add a set of root paths to the existing list
  set addRoots(Set<Directory> roots);
  /// Delete a set of root paths from the existing list
  set delRoots(Set<Directory> roots);
  /// Clear all paths from the scan list
  void clrRoots();

  Set<Directory> get getRoots;

  /// Scan the list of root paths for files. Specify [roots] to scan a set of roots apart from the stored list.
  /// Specify [roots] and [set] to scan [roots] and do an operation on the stored list. Note: This does not modify and then scan,
  /// it scans the specified list of roots in [roots], and then modifies the stored list
  Set<Directory>? scan({Set<Directory>? roots, Scanmode? set});
}

/// Generic file scanner. Implements basic, system agnostic var checks to reduce code duplication
class GenericFScanner implements FileScanner {
  final Set<Directory> _rootDirs;

  GenericFScanner({Set<Directory>? rootDirs}): _rootDirs = HashSet<Directory>() {
    if(rootDirs != null) {_addRoots(rootDirs);}
  }

  Future<Set<String>?> _validatePathSanity(Iterable<String> paths) async {
    if(paths.isEmpty) throw InvalidArgumentException("Given empty paths list");

    Set<String> res = HashSet();
    for(String cur in paths) {
      if(!await Directory(cur).exists()) {res.add(cur);}
    }

    return (res.isEmpty) ? null : res;
  }

  /// Validate an iterable list of paths, but throw an exception if any are insane
  void _xValidatePathSanity(Iterable<String> paths) async {
    Set<String>? insanePaths = await _validatePathSanity(paths);
    if(insanePaths != null) {
      throw InsanePathException("Got the following invalid paths: $insanePaths");
    }

    return;
  }



  void _setRoots(Set<String> roots) {clrRoots(); _addRoots(roots);}
  void _delRoots(Set<String> roots) {_rootDirs.removeAll(roots);}
  @override void clrRoots() {_rootDirs.clear();}

  void _addRoots(Set<String> roots) {
    _xValidatePathSanity(roots);
    _rootDirs.addAll(roots);
  }

  Set<String> _getRoots() {return _roots;}



  @override set setRoots(Set<String> roots) {_setRoots(roots);}
  @override set addRoots(Set<String> roots) {_addRoots(roots);}
  @override set delRoots(Set<String> roots) {_delRoots(roots);}
  @override Set<String> get getRoots => _getRoots();

  @override
  Set<String>? scan({Set<String>? roots, Scanmode? set}) {
    throw UnimplementedError("GenericFScanner can not scan, as such an operation is OS specific");
  }

  @override bool validatePathSanity(String path) {
    return (_validatePathSanity([path]) == null) ? true : false;
  }

}



class LinuxFScanner extends GenericFScanner implements FileScanner {
  LinuxFScanner([super.roots]);

  @override
  Set<String>? _validatePathSanity(Iterable<String> paths) {
      HashSet<String> res = HashSet<String>();

      for(String cur in paths) {
        if(cur is not sane) {res.add(cur);}
      }

    return (res.isEmpty) ? null : res;
  }

  @override
  Set<String>? scan({Set<String>? roots, Scanmode? set}) {
    // TODO: Implement this
    return null;

    // Set<String> res = HashSet<String>();
    // Set<String> toScan = _roots;

    // if(roots != null && set != null) {
    //   switch(set) {
    //     case Scanmode.scanAdd: _addRoots(roots); break;
    //     case Scanmode.scanSet: _setRoots(roots); break;
    //     case Scanmode.scanDel: _delRoots(roots); break;
    //   }

    //   toScan = roots;
    // }

    // // Do scan. Return null if error occurs
    // return res;
  }

  // End of class
}

// TODO: Windows and MacOS scanners planned
import 'dart:collection';

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
  /// Validate a path's sanity
  bool validatePathSanity(String path);
    // May add a list/iterable version in the future if necessary

  /// Set a new set of root paths for scanning
  set setRoots(Set<String> roots);
  /// Add a set of root paths to the existing list
  set addRoots(Set<String> roots);
  /// Delete a set of root paths from the existing list
  set delRoots(Set<String> roots);
  /// Clear all paths from the scan list
  void clrRoots();

  Set<String> get getRoots;

  /// Scan the list of root paths for files. Specify [roots] to scan a set of roots apart from the stored list.
  /// Specify [roots] and [set] to scan [roots] and do an operation on the stored list. Note: This does not modify and then scan,
  /// it scans the specified list of roots in [roots], and then modifies the stored list
  Set<String>? scan({Set<String>? roots, Scanmode? set});
}

/// Generic file scanner. Implements basic, system agnostic var checks to reduce code duplication
class GenericFScanner implements FileScanner {
  final Set<String> _roots;

  GenericFScanner([Set<String>? roots]): _roots = HashSet<String>() {
    if(roots != null) {_addRoots(roots);}
  }


  /// Validate an iterable list of paths. If no paths are insane, returns null. Otherwise returns a set of offending paths
  Set<String>? _validatePathSanity(Iterable<String> paths) {
    throw UnimplementedError("GenericFScanner can not validate paths, as such an operation is OS specific");
  }

  /// Validate an iterable list of paths, but throw an exception if any are insane
  void _xValidatePathSanity(Iterable<String> paths) {
    Set<String>? insanePaths = _validatePathSanity(paths);
    if(insanePaths != null) {
      throw InsanePathException("Got the following invalid paths: $insanePaths");
    }
  }



  void _setRoots(Set<String> roots) {clrRoots(); _addRoots(roots);}
  void _delRoots(Set<String> roots) {_roots.removeAll(roots);}
  @override void clrRoots() {_roots.clear();}

  void _addRoots(Set<String> roots) {
    _xValidatePathSanity(roots);
    _roots.addAll(roots);
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
    // TODO: Implement this
    throw UnimplementedError();

  //     HashSet<String> res = HashSet<String>();

  //     for(String cur in paths) {
  //       if(cur is not sane) {res.add(cur);}
  //     }

  //   return (res.isEmpty) ? null : res;
  }

  @override
  Set<String>? scan({Set<String>? roots, Scanmode? set}) {
    // TODO: Implement this
    throw UnimplementedError();

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
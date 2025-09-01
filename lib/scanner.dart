import 'dart:collection';

enum scanmode {
  scanSet,
  scanAdd,
  scanDel
}

abstract interface class FileScanner {
  bool validatePathSanity(String path);

  set setRoots(Set<String> roots);
  set addRoots(Set<String> roots);
  set delRoots(Set<String> roots);
  void clrRoots();

  Set<String> get getRoots;

  Set<String>? scan({Set<String>? roots, scanmode? set});
}

// Generic file scanner. Implements basic, system agnostic var checks to reduce duplication
class GenericFScanner implements FileScanner {
  final Set<String> _roots;

  GenericFScanner([Set<String>? roots]): _roots = roots ?? HashSet<String>();



  @override
  bool validatePathSanity(String path) {
    throw UnimplementedError("GenericFScanner can not validate path sanity, as such an operation is OS specific");
  }

  void _addRoots(Set<String> roots) {
    _roots.addAll(roots);
  }



  @override
  set setRoots(Set<String> roots) {
    clrRoots();
    _addRoots(roots);
  }

  @override
  set addRoots(Set<String> roots) {
    _roots.addAll(roots);
  }

  @override
  set delRoots(Set<String> roots) {
    _roots.removeAll(roots);
  }

  @override
  void clrRoots() {
    _roots.clear();
  }



  @override
  Set<String> get getRoots => _roots;



  @override
  Set<String>? scan({Set<String>? roots, scanmode? set}) {
    throw UnimplementedError("GenericFScanner can not scan, as scanning a filesystem is an OS specific operation. Use Linux/Windows/MacOS-FScanner");
  }

}



class LinuxFScanner extends GenericFScanner implements FileScanner {
  LinuxFScanner([super.roots]);

  @override
  bool validatePathSanity(Iterable<String> path) {
    // TODO: Implement this for linux
    throw UnimplementedError("Haven't implemented this yet!");
  }



  @override
  set setRoots(Set<String> roots) {
    for(String cur in roots) {
      if(!validatePathSanity(cur)) {
        throw InsanePathError("Path \"$cur\" is an invalid path for Linux based systems");
      }
    }

    super.setRoots(roots);
  }

  @override
  set addRoots(Set<String> roots) {
    super.addAll(roots);
  }

  @override
  set delRoots(Set<String> roots) {
    _roots.removeAll(roots);
  }

  @override
  void clrRoots() {
    _roots.clear();
  }



  @override
  Set<String> get getRoots => _roots;



  @override
  Set<String>? scan({Set<String>? roots, scanmode? set}) {
    throw UnimplementedError("GenericFScanner can not scan, as scanning a filesystem is an OS specific operation. Use Linux/Windows/MacOS-FScanner");
  }

}
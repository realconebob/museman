import 'package:museman/scanner.dart';
import 'package:test/test.dart';

void main() {
  test("GenericFScanner throws exceptions when expected", () {
    // Throw exception when:
      // Trying to scan
      // Trying to validate path

    // Reason: GenericFScanner is for the code duplicated across system specific scanners, not OS specific code. Scanning and
    //  handling paths depneds on the system used, and so should be defered to a child class

    FileScanner gfs = GenericFScanner();
    expect(gfs.scan, throwsA(isA<UnimplementedError>()));

    expect(() => gfs.validatePathSanity(""), throwsA(isA<UnimplementedError>()));
    expect(() => gfs.validatePathSanity("/root/linux/style/path"), throwsA(isA<UnimplementedError>()));
    expect(() => gfs.validatePathSanity("C:\\Windows\\Style\\Path"), throwsA(isA<UnimplementedError>()));
    expect(() => gfs.validatePathSanity("/Macos/style/path"), throwsA(isA<UnimplementedError>()));
  });

  test("LinuxFScanner gets and sets properly", () {
    const Set<String> roots1 = {""};
    const Set<String> roots2 = {""};
    const Set<String> roots3 = {""};

    FileScanner lfs = LinuxFScanner();
    lfs.setRoots = roots1;
    lfs.addRoots = roots2;

    expect(() {
      Set<String> temp = lfs.getRoots;
      for(String cur in temp) {
        if(roots1.lookup(cur) == null && roots2.lookup(cur) == null) {
          return false;
        }
      }

      return true;
    }.call(), isTrue);

    lfs.setRoots = roots3;

    expect(() {
      Set<String> temp = lfs.getRoots;
      for(String cur in temp) {
        if(roots3.lookup(cur) == null) {
          return false;
        }
      }

      return true;
    }.call(), isTrue);

  });
}
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

  test("GenericFScanner sets and gets expected values", () {
    const Set<String> roots1 = {"/path1/", "/path1/path2", "////path3"};
    const Set<String> roots2 = {"C:\\path2", "path3", "C:\\\\\\path4"};
    FileScanner gfs = GenericFScanner();

    try {
      gfs.setRoots = roots1;
    } catch (e) {}

    try {
      gfs.addRoots = roots2;
    } catch (e) {}


    expect(() {
      Set<String> tmp = gfs.getRoots;
      for (String cur in tmp) {
        if(roots1.lookup(cur) == null && roots2.lookup(cur) == null){
            return false;
          }

      }
      return true;
    }.call(), isTrue);

    try {
      gfs.delRoots = roots1;
    } catch (e) {}

    expect(() {
      Set<String> tmp = gfs.getRoots;
      for (String cur in tmp) {
        if(roots2.lookup(cur) == null){
            return false;
          }

      }
      return true;
    }.call(), isTrue);

    return;
  });


}
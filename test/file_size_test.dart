import 'package:flutter_test/flutter_test.dart';
import '../lib/file_size.dart';

void main() {
  test("Test for Bytes [int]", () {
    expect(FileSize.getSize(10), "10 B");
  });

  test("Test for Bytes [String]", () {
    expect(FileSize.getSize("10"), "10 B");
  });

  test("Test for KiloBytes [int]", () {
    expect(FileSize.getSize(1024), "1 KB");
  });

  test("Test for KiloBytes [String]", () {
    expect(FileSize.getSize("1024"), "1 KB");
  });

  test("Test for MegaBytes [int]", () {
    expect(FileSize.getSize(1024 * 1024), "1 MB");
  });

  test("Test for GigaBytes [int]", () {
    expect(FileSize.getSize(1024 * 1024 * 1024), "1 GB");
  });

  test("Test for TeraBytes [int]", () {
    expect(FileSize.getSize(1024 * 1024 * 1024 * 1024), "1 TB");
  });

  test("Test for PetaBytes [int]", () {
    expect(FileSize.getSize(1024 * 1024 * 1024 * 1024 * 1024), "1 PB");
  });
}

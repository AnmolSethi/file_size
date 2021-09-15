import 'package:file_sizes/file_sizes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test for Bytes [int]", () {
    expect(FileSize.getSize(10), "10 B");
  });

  test("Test for Bytes [String]", () {
    expect(FileSize.getSize("10"), "10 B");
  });

  test("Test for KiloBytes [int]", () {
    expect(
      FileSize.getSize(1024, precision: PrecisionValue.None),
      "1.00 KB",
    );
  });

  test("Test for KiloBytes [String]", () {
    expect(
      FileSize.getSize("1024", precision: PrecisionValue.None),
      "1.00 KB",
    );
  });

  test("Test for MegaBytes [int]", () {
    expect(
      FileSize.getSize(1024 * 1024, precision: PrecisionValue.None),
      "1.00 MB",
    );
  });

  test("Test for GigaBytes [int]", () {
    expect(
      FileSize.getSize(1024 * 1024 * 1024, precision: PrecisionValue.None),
      "1.00 GB",
    );
  });

  test("Test for TeraBytes [int]", () {
    expect(
      FileSize.getSize(1024 * 1024 * 1024 * 1024,
          precision: PrecisionValue.Two),
      "1.00 TB",
    );
  });

  test("Test for PetaBytes [int]", () {
    expect(
      FileSize.getSize(
        1024 * 1024 * 1024 * 1024 * 1024,
        precision: PrecisionValue.None,
      ),
      "1.00 PB",
    );
  });
}

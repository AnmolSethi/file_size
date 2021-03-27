import 'package:file_sizes/file_sizes.dart';

void main() {
  int baseNumber = 1024;

  /// Get KiloBytes
  String bytes = FileSize.getSize(baseNumber);
  print(bytes);

  /// Get MegaBytes
  String megabytes = FileSize.getSize(baseNumber * baseNumber);
  print(megabytes);
}

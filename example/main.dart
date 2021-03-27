import 'package:file_size/file_size.dart';

void main() {
  int baseNumber = 1024;

  /// Get KiloBytes
  String bytes = FileSize.getSize(baseNumber);
  print(bytes);

  /// Get MegaBytes
  String megabytes = FileSize.getSize(baseNumber * baseNumber);
  print(megabytes);
}

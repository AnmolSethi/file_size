import 'package:file_sizes/file_sizes.dart';

void main() {
  /// Initialze [FileSize] Class
  FileSize fileSize = FileSize();

  /// 12.35 KB
  print(fileSize.getSize(12345));

  /// 12.35 KB
  print(fileSize.getKiloBytes(12345));

  /// 12.34500 KB
  print(fileSize.getKiloBytes(12345, value: PrecisionValue.Five));

  /// 98765.532 KB
  print(fileSize.getKiloBytes(98765532, value: PrecisionValue.Three));

  /// 98765.532 KB
  print(fileSize.getPetaBytes(9876522532, value: PrecisionValue.Six));
}

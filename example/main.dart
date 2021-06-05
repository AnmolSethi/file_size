import 'package:file_sizes/file_sizes.dart';

void main() {
  /// Integer Values
  ///
  /// 12.06 KB
  print(FileSize.getSize(12345));

  /// 12.06 KB
  print(FileSize.getKiloBytes(12345));

  /// 12.05566 KB
  print(FileSize.getKiloBytes(12345, value: PrecisionValue.Five));

  /// 96450.712 KB
  print(FileSize.getKiloBytes(98765532, value: PrecisionValue.Three));

  /// String Values
  ///
  /// 12.06 KB
  print(FileSize.getSize('12345'));

  /// 12.06 KB
  print(FileSize.getKiloBytes('12345'));

  /// 12.05566 KB
  print(FileSize.getKiloBytes('12345', value: PrecisionValue.Five));

  /// 96450.712 KB
  print(FileSize.getKiloBytes('98765532', value: PrecisionValue.Three));
}

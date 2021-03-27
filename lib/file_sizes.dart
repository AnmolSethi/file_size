library file_sizes;

import 'types.dart';

class FileSize {
  ///  [size] can be passed as number or as string
  ///  the optional parameter [PrecisionValue] specifies the number
  ///  of digits after comma/point (default is [PrecisionValue.Two])
  ///
  /// Example:
  /// ```dart
  ///    FileSize.getSize(1024)
  ///  ```
  static String getSize(dynamic size,
      {PrecisionValue precisionValue = PrecisionValue.Two}) {
    int divider = 1024;
    num _size;
    int precision = _getPrecisionValue(precisionValue);

    try {
      _size = size is num ? size : int.parse(size.toString());
    } on FormatException catch (e) {
      throw FormatException("Can not parse the size parameter: $e");
    }

    if (_size < divider) return "$_size B";

    if (_size < divider * divider && _size % divider == 0)
      return "${(_size / divider).toStringAsFixed(0)} KB";

    if (_size < divider * divider)
      return "${(_size / divider).toStringAsFixed(precision)} KB";

    if (_size < divider * divider * divider && _size % divider == 0)
      return "${(_size / (divider * divider)).toStringAsFixed(0)} MB";

    if (_size < divider * divider * divider)
      return "${(_size / divider / divider).toStringAsFixed(precision)} MB";

    if (_size < divider * divider * divider * divider && _size % divider == 0)
      return "${(_size / (divider * divider * divider)).toStringAsFixed(0)} GB";

    if (_size < divider * divider * divider * divider)
      return "${(_size / divider / divider / divider).toStringAsFixed(precision)} GB";

    if (_size < divider * divider * divider * divider * divider &&
        _size % divider == 0) {
      num r = _size / divider / divider / divider / divider;
      return "${r.toStringAsFixed(0)} TB";
    }

    if (_size < divider * divider * divider * divider * divider) {
      num r = _size / divider / divider / divider / divider;
      return "${r.toStringAsFixed(precision)} TB";
    }

    if (_size < divider * divider * divider * divider * divider * divider &&
        _size % divider == 0) {
      num r = _size / divider / divider / divider / divider / divider;
      return "${r.toStringAsFixed(0)} PB";
    } else {
      num r = _size / divider / divider / divider / divider / divider;
      return "${r.toStringAsFixed(precision)} PB";
    }
  }
}

int _getPrecisionValue(PrecisionValue value) {
  switch (value) {
    case PrecisionValue.None:
      return 0;
    case PrecisionValue.One:
      return 1;
    case PrecisionValue.Two:
      return 2;
    case PrecisionValue.Three:
      return 3;
    case PrecisionValue.Four:
      return 4;
    case PrecisionValue.Five:
      return 5;
    case PrecisionValue.Six:
    default:
      return 6;
  }
}

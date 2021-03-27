library file_sizes;

class FileSize {
  static String getSize(dynamic size, {int precision = 2}) {
    /*  [size] can be passed as number or as string
        the optional parameter [precision] specifies the number 
        of digits after comma/point (default is 2)  
    */
    int divider = 1024;
    num _size;

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

/// [FileSizeType] for getting the result in the desired string representation
/// By default, it is set to [FileSizeType.Default]
enum FileSizeType {
  Default,
  Bytes,
  KiloBytes,
  MegaBytes,
  GigaBytes,
  TeraBytes,
  PetaBytes,
  ExaBytes,
  ZettaBytes,
  YottaBytes
}

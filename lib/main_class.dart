part of file_sizes;

const int _divider = 1024;

class FileSize {
  static PrecisionValue _precisionValue = PrecisionValue.Two;

  ///  [size] can be passed as number or as string
  ///  the optional parameter [PrecisionValue] specifies the number
  ///  of digits after comma/point (default is [PrecisionValue.Two])
  ///
  /// Example:
  /// ```dart
  ///    FileSize.getSize(1024)
  ///    FileSize.getSize(1024, precisionValue = PrecisionValue.Four)
  ///  ```
  static String getSize(dynamic size,
      {PrecisionValue precision = PrecisionValue.Two}) {
    int? _size = _parseValue(size);

    if (_size < _divider) return getBytes(_size);
    if (_size < _getDividerValue(2)) return getKiloBytes(_size);
    if (_size < _getDividerValue(3)) return getMegaBytes(_size);
    if (_size < _getDividerValue(4)) return getGigaBytes(_size);
    if (_size < _getDividerValue(5)) return getTeraBytes(_size);
    if (_size < _getDividerValue(6)) return getPetaBytes(_size);
    if (_size < _getDividerValue(7)) return getExaBytes(_size);
    if (_size < _getDividerValue(8)) return getYottaBytes(_size);
    if (_size < _getDividerValue(9)) return getZettaBytes(_size);
    return getZettaBytes(_size);
  }

  /// It returns the size of the file in bytes
  ///
  /// [FileSizeType.Bytes]
  static String getBytes(dynamic data) => "${_parseValue(data)} B";

  /// It returns the size of the file in kilo bytes
  ///
  /// [FileSizeType.KiloBytes]
  static String getKiloBytes(dynamic data, {PrecisionValue? value}) {
    return "${(_parseValue(data) / 1024).toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} KB";
  }

  /// It returns the size of the file in mega bytes
  ///
  /// [FileSizeType.MegaBytes]
  static String getMegaBytes(dynamic data, {PrecisionValue? value}) {
    return "${(_parseValue(data) / _getDividerValue(2)).toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} MB";
  }

  /// It returns the size of the file in giga bytes
  ///
  /// [FileSizeType.GigaBytes]
  static String getGigaBytes(dynamic data, {PrecisionValue? value}) {
    return "${(_parseValue(data) / _getDividerValue(3)).toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} GB";
  }

  /// It returns the size of the file in tera bytes
  ///
  /// [FileSizeType.TeraBytes]
  static String getTeraBytes(dynamic data, {PrecisionValue? value}) {
    num r = _parseValue(data) / _getDividerValue(4);
    return "${r.toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} TB";
  }

  /// It returns the size of the file in peta bytes
  ///
  /// [FileSizeType.PetaBytes]
  static String getPetaBytes(dynamic data, {PrecisionValue? value}) {
    num r = _parseValue(data) / _getDividerValue(5);
    return "${r.toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} PB";
  }

  /// It returns the size of the file in exa bytes
  ///
  /// [FileSizeType.ExaBytes]
  static String getExaBytes(dynamic data, {PrecisionValue? value}) {
    num r = _parseValue(data) / _getDividerValue(6);
    return "${r.toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} EB";
  }

  /// It returns the size of the file in yotta bytes
  ///
  /// [FileSizeType.YottaBytes]
  static String getYottaBytes(dynamic data, {PrecisionValue? value}) {
    num r = _parseValue(data) / _getDividerValue(7);
    return "${r.toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} YB";
  }

  /// It returns the size of the file in zetta bytes
  ///
  /// [FileSizeType.ZettaBytes]
  static String getZettaBytes(dynamic data, {PrecisionValue? value}) {
    num r = _parseValue(data) / _getDividerValue(8);
    return "${r.toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} ZB";
  }

  static int _parseValue(dynamic size) {
    try {
      return size is int ? size : int.parse(size.toString());
    } on FormatException catch (e) {
      throw FormatException("Can not parse the size parameter: ${e.message}");
    }
  }
}

int _getDividerValue(int numberOf) {
  int finalValue = _divider;
  for (int i = 0; i < numberOf - 1; i++) {
    finalValue *= _divider;
  }
  return finalValue;
}

int _getPrecisionValue(PrecisionValue value) =>
    PrecisionValue.values.indexOf(value);

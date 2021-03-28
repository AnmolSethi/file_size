part of file_sizes;

abstract class Sizes {
  String getBytes(int data);
  String getKiloBytes(int data, {PrecisionValue? value});
  String getMegaBytes(int data, {PrecisionValue? value});
  String getGigaBytes(int data, {PrecisionValue? value});
  String getTeraBytes(int data, {PrecisionValue? value});
  String getPetaBytes(int data, {PrecisionValue? value});
  String getExaBytes(int data, {PrecisionValue? value});
  String getZettaBytes(int data, {PrecisionValue? value});
  String getYottaBytes(int data, {PrecisionValue? value});
}

class FileSize implements Sizes {
  PrecisionValue _precisionValue = PrecisionValue.Two;

  ///  [size] can be passed as number or as string
  ///  the optional parameter [PrecisionValue] specifies the number
  ///  of digits after comma/point (default is [PrecisionValue.Two])
  ///
  /// Example:
  /// ```dart
  ///    FileSize.getSize(1024)
  ///    FileSize.getSize(1024, precisionValue = PrecisionValue.Four)
  ///  ```
  String getSize(dynamic size,
      {PrecisionValue precisionValue = PrecisionValue.Two}) {
    int divider = 1024;
    int _size;
    this._precisionValue = precisionValue;

    try {
      _size = size is int ? size : int.parse(size.toString());
    } on FormatException catch (e) {
      throw FormatException("Can not parse the size parameter: ${e.message}");
    }

    if (_size < divider) return getBytes(_size);
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
  @override
  String getBytes(int data) => "$data B";

  /// It returns the size of the file in bytes
  ///
  /// [FileSizeType.KiloBytes]
  @override
  String getKiloBytes(int data, {PrecisionValue? value}) {
    return "${(data / 1024).toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} KB";
  }

  /// It returns the size of the file in bytes
  ///
  /// [FileSizeType.MegaBytes]
  @override
  String getMegaBytes(int data, {PrecisionValue? value}) {
    return "${(data / _getDividerValue(2)).toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} MB";
  }

  /// It returns the size of the file in bytes
  ///
  /// [FileSizeType.GigaBytes]
  @override
  String getGigaBytes(int data, {PrecisionValue? value}) {
    return "${(data / _getDividerValue(3)).toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} GB";
  }

  /// It returns the size of the file in bytes
  ///
  /// [FileSizeType.TeraBytes]
  @override
  String getTeraBytes(int data, {PrecisionValue? value}) {
    num r = data / _getDividerValue(4);
    return "${r.toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} TB";
  }

  /// It returns the size of the file in bytes
  ///
  /// [FileSizeType.PetaBytes]
  @override
  String getPetaBytes(int data, {PrecisionValue? value}) {
    num r = data / _getDividerValue(5);
    return "${r.toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} PB";
  }

  /// It returns the size of the file in bytes
  ///
  /// [FileSizeType.ExaBytes]
  @override
  String getExaBytes(int data, {PrecisionValue? value}) {
    num r = data / _getDividerValue(6);
    return "${r.toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} EB";
  }

  /// It returns the size of the file in bytes
  ///
  /// [FileSizeType.YottaBytes]
  @override
  String getYottaBytes(int data, {PrecisionValue? value}) {
    num r = data / _getDividerValue(7);
    return "${r.toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} YB";
  }

  /// It returns the size of the file in bytes
  ///
  /// [FileSizeType.ZettaBytes]
  @override
  String getZettaBytes(int data, {PrecisionValue? value}) {
    num r = data / _getDividerValue(8);
    return "${r.toStringAsFixed(_getPrecisionValue(value ?? _precisionValue))} ZB";
  }
}

int _getDividerValue(int numberOf) {
  int finalValue = 1024;
  for (int i = 0; i < numberOf - 1; i++) {
    finalValue *= 1024;
  }
  return finalValue;
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

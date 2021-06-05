# FileSize

[![pub package](https://img.shields.io/pub/v/file_sizes.svg)](https://pub.dartlang.org/packages/file_sizes) [![Dart](https://github.com/aguilaair/filesize/actions/workflows/dart.yml/badge.svg)](https://github.com/AnmolSethi/file_sizes/actions/workflows/dart.yml)

Get the Human readable size of the file. It is purely written in dart and support both number and string as parameters.

## Examples

> getSize(string or number, {PrecisionValue}): returns String

- Direct Method Call

```dart
FileSize.getSize(1000)               '1.00 KB'
FileSize.getSize(1048576)            '1.04 MB'
FileSize.getSize(1073741824)         '1.00 GB'
FileSize.getSize(1099511627776)      '1.00 TB'
```

- Method call with PrecisionValue [Optional]

```dart
FileSize.getSize(664365320, PrecisionValue.THREE)      "633.588 MB"
FileSize.getSize(4324324232343, PrecisionValue.FOUR)   "3.9321 TB"
```

- Method call without decimal value

```dart
FileSize.getSize(664365320, PrecisionValue.NONE)         "633 MB"
FileSize.getSize(4324324232343, PrecisionValue.NONE)     "3 TB"
```

> getKiloBytes(string or number, {PrecisionValue}): returns String

```dart
FileSize.getKiloBytes(54613)      '54.61 KB'
```

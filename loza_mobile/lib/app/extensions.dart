import 'constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int?{
  int? orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double?{
  double? orZeroD() {
    if (this == null) {
      return Constants.zeroD;
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool orTrue() {
    if (this == null) {
      return Constants.orTrue;
    } else {
      return this!;
    }
  }
}

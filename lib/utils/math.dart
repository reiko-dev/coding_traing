import 'package:flutter/gestures.dart';

double map({
  required double value,
  double currentValueLowerBound = 0,
  double currentValueUpperBound = 1,
  double targetValueLowerBound = 0,
  double targetValueUpperBound = 100,
  Offset? bounds,
}) {
  assert(currentValueLowerBound < currentValueUpperBound);
  assert(targetValueLowerBound < targetValueUpperBound);

  if (value <= currentValueLowerBound) {
    return targetValueLowerBound;
  } else if (value >= currentValueUpperBound) {
    return targetValueUpperBound;
  }
  value = value < 0 ? -value : value;

  double currentValueSize = currentValueUpperBound - currentValueLowerBound;

  //size = 100%
  // value = x;
  //x = 100 * value /size
  double percent = 100 * value / currentValueSize;

  double targetValueSize = targetValueUpperBound - targetValueLowerBound;

  double result = percent / 100 * targetValueSize;

  return targetValueLowerBound + result;
}

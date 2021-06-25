import 'package:coding_traing/utils/math.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Tests the map function onyl with value', () {
    double result = map(value: 0);
    expect(result, 0);

    result = map(value: 1);
    expect(result, 100);

    result = map(value: -1);
    expect(result, 0);

    result = map(value: 2);
    expect(result, 100);
  });

  test('Tests the map function with all args', () {
    double result = map(
      value: -20,
      currentValueLowerBound: -20,
      currentValueUpperBound: 40,
      targetValueLowerBound: 1,
      targetValueUpperBound: 10,
    );
    expect(result, 1);

    result = result = map(
      value: -21,
      currentValueLowerBound: -20,
      currentValueUpperBound: 40,
      targetValueLowerBound: 1,
      targetValueUpperBound: 10,
    );
    expect(result, 1);

    result = result = map(
      value: 40,
      currentValueLowerBound: -20,
      currentValueUpperBound: 40,
      targetValueLowerBound: 1,
      targetValueUpperBound: 10,
    );
    expect(result, 10);

    result = result = map(
      value: 41,
      currentValueLowerBound: -20,
      currentValueUpperBound: 40,
      targetValueLowerBound: 1,
      targetValueUpperBound: 10,
    );
    expect(result, 10);
  });

  test('Tests the map function with intermediary values', () {
    double result = map(value: 0.5, targetValueLowerBound: 0);
    expect(result, 50);

    result = map(
      value: 0.25,
      targetValueLowerBound: 4,
      targetValueUpperBound: 8,
    );
    expect(result, 5);

    result = map(
      value: 55,
      currentValueLowerBound: 0,
      currentValueUpperBound: 100,
      targetValueLowerBound: 0,
      targetValueUpperBound: 20,
    );
    expect(result, 11);

    result = map(
      value: 10,
      currentValueLowerBound: 0,
      currentValueUpperBound: 15,
      targetValueLowerBound: 0,
      targetValueUpperBound: 100,
    );
    expect(result, 2 * 100 / 3);
  });

  test('Tests the map function with negative values', () {
    double result;
    result = map(
      value: -2,
      currentValueLowerBound: -4,
      currentValueUpperBound: 2,
    );
    expect(result, 100 / 3);

    result = map(
      value: -3,
      currentValueLowerBound: -6,
      currentValueUpperBound: -1,
    );
    expect(result, 60);

    result = map(
      value: -5,
      currentValueLowerBound: -10,
      currentValueUpperBound: 10,
      targetValueLowerBound: -50,
      targetValueUpperBound: 50,
    );
    expect(result, -25);
  });
}

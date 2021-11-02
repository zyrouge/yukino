import 'dart:async';

abstract class FunctionUtils {
  static Future<T> tryLoop<T>(
    final FutureOr<T> Function() fn, {
    required final int max,
    final int i = 0,
    final Duration? interval,
  }) async {
    int _i = i;
    while (_i < max) {
      try {
        return await fn();
      } catch (err) {
        _i += 1;

        if (!(_i < max)) {
          rethrow;
        }

        if (interval != null) {
          await Future<void>.delayed(interval);
        }
      }
    }

    throw Error();
  }

  static T withValue<T>(final T value, final T Function(T) fn) => fn(value);
}
/// The result of an operation that may fail.
sealed class Result<T> {
  const Result();

  /// Creates a successful [Result], completed with the specified [value].
  const factory Result.ok(T value) = Ok._;

  /// Creates an error [Result], completed with the specified [error].
  const factory Result.error(Object error) = Error._;
}

/// An operation that successfully completed with a value.
final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  /// The value returned by the operation.
  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

/// An operation that vailed with an error.
final class Error<T> extends Result<T> {
  const Error._(this.error);

  /// The error returned by the operation.
  final Object error;

  @override
  String toString() => 'Result<$T>.error($error)';
}

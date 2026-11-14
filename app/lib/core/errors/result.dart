import 'failure.dart';

/// Two cases, with plain getters. No generic callback helper.
sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success<T>;

  const factory Result.failure(Failure failure) = Fail<T>;

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is Fail<T>;

  T get requireValue {
    final Result<T> result = this;
    if (result is Success<T>) return result.value;
    throw StateError('Result is a failure: ${(result as Fail<T>).failure}');
  }

  Failure get requireFailure {
    final Result<T> result = this;
    if (result is Fail<T>) return result.failure;
    throw StateError('Result is a success');
  }
}

final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

final class Fail<T> extends Result<T> {
  const Fail(this.failure);

  final Failure failure;
}

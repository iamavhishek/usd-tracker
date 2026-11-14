/// What went wrong, in one flat value. No subclasses, no pattern matching.
enum FailureKind {
  network,
  timeout,
  cancelled,
  unauthorized,
  forbidden,
  notFound,
  server,
  validation,
  cache,
  unknown,
}

final class Failure {
  const Failure(
    this.kind, {
    this.message,
    this.statusCode,
    this.fieldErrors = const <String, List<String>>{},
  });

  const Failure.network({String? message})
    : this(FailureKind.network, message: message);

  const Failure.timeout() : this(FailureKind.timeout);

  const Failure.cancelled() : this(FailureKind.cancelled);

  const Failure.unauthorized() : this(FailureKind.unauthorized);

  const Failure.forbidden() : this(FailureKind.forbidden);

  const Failure.notFound() : this(FailureKind.notFound);

  const Failure.server({String? message, int? statusCode})
    : this(FailureKind.server, message: message, statusCode: statusCode);

  const Failure.validation(Map<String, List<String>> errors)
    : this(FailureKind.validation, fieldErrors: errors);

  const Failure.cache({String? message})
    : this(FailureKind.cache, message: message);

  const Failure.unknown({String? message})
    : this(FailureKind.unknown, message: message);

  final FailureKind kind;
  final String? message;
  final int? statusCode;
  final Map<String, List<String>> fieldErrors;

  bool get isRetryable {
    return kind != FailureKind.cancelled &&
        kind != FailureKind.unauthorized &&
        kind != FailureKind.forbidden;
  }

  @override
  bool operator ==(Object other) {
    return other is Failure &&
        other.kind == kind &&
        other.message == message &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode => Object.hash(kind, message, statusCode);

  @override
  String toString() {
    return 'Failure(${kind.name}${message == null ? '' : ': $message'})';
  }
}

import 'failure.dart';

/// User-facing copy in one place: a switch on the failure kind.
extension FailureCopy on Failure {
  String get headline => switch (kind) {
    FailureKind.network || FailureKind.timeout => 'No connection',
    FailureKind.unauthorized => 'API key required',
    FailureKind.forbidden => 'Not allowed',
    FailureKind.notFound => 'Nothing here yet',
    FailureKind.server => 'Server error',
    FailureKind.validation => 'Check your input',
    FailureKind.cache => 'Could not read saved data',
    FailureKind.cancelled => 'Cancelled',
    FailureKind.unknown => 'Something went wrong',
  };

  String get detail => switch (kind) {
    FailureKind.network => 'Check your internet connection and try again.',
    FailureKind.timeout => 'The backend took too long to answer. Try again.',
    FailureKind.unauthorized => 'This build is missing the backend API key. Set API_KEY when building the app.',
    FailureKind.forbidden => 'This device is not allowed to do that.',
    FailureKind.notFound =>
      'The backend has not stored a rate for this currency yet.',
    FailureKind.server =>
      message ?? 'The server could not complete that request.',
    FailureKind.validation =>
      fieldErrors.values.expand((List<String> messages) => messages).join('\n'),
    FailureKind.cache => message ?? 'Saved data could not be read.',
    FailureKind.cancelled => 'The request was cancelled.',
    FailureKind.unknown => 'Try again in a moment.',
  };
}

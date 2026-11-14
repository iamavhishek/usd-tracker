enum AppFlavor { dev, prod }

/// Build-time configuration. Nothing secret belongs here except the optional
/// API key, which is extractable from a mobile binary; use it for personal and
/// internal builds, not as a public-app secret.
final class AppEnv {
  const AppEnv({
    required this.flavor,
    required this.baseUrl,
    required this.apiKey,
    required this.defaultQuote,
  });

  final AppFlavor flavor;
  final String baseUrl;
  final String apiKey;
  final String defaultQuote;

  bool get hasApiKey => apiKey.isNotEmpty;

  static AppEnv fromDefines() {
    const String flavorValue = String.fromEnvironment(
      'APP_ENV',
      defaultValue: 'dev',
    );
    const String baseUrlOverride = String.fromEnvironment('API_BASE_URL');
    const String apiKey = String.fromEnvironment('API_KEY');
    const String quote = String.fromEnvironment('QUOTE', defaultValue: 'NPR');

    const AppFlavor flavor = flavorValue == 'prod'
        ? AppFlavor.prod
        : AppFlavor.dev;

    if (flavor == AppFlavor.prod && baseUrlOverride.isEmpty) {
      throw StateError(
        'API_BASE_URL must be provided for APP_ENV=prod '
        '(use --dart-define=API_BASE_URL=https://…).',
      );
    }

    final String baseUrl = baseUrlOverride.isNotEmpty
        ? baseUrlOverride
        : 'http://10.0.2.2:3000/api/v1';

    return AppEnv(
      flavor: flavor,
      baseUrl: _trimTrailingSlash(baseUrl),
      apiKey: apiKey,
      defaultQuote: quote.toUpperCase(),
    );
  }

  static String _trimTrailingSlash(String value) {
    return value.endsWith('/') ? value.substring(0, value.length - 1) : value;
  }
}

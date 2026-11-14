import 'package:intl/intl.dart';

abstract final class AppFormatters {
  static final NumberFormat _rateFormat = NumberFormat('#,##0.00##', 'en_US');
  static final DateFormat _dayFormat = DateFormat('d MMM');
  static final DateFormat _dateTimeFormat = DateFormat('d MMM · HH:mm');

  static const String _placeholder = '—';

  static String rate(double? value) {
    if (value == null) return _placeholder;
    return _rateFormat.format(value);
  }

  static String signed(double? value) {
    if (value == null) return _placeholder;
    final String sign = value > 0 ? '+' : '';
    return '$sign${value.toStringAsFixed(2)}';
  }

  static String percent(double? value) {
    if (value == null) return _placeholder;
    final String sign = value > 0 ? '+' : '';
    return '$sign${value.toStringAsFixed(2)}%';
  }

  static String day(String? iso) {
    final DateTime? date = _parse(iso);
    return date == null ? _placeholder : _dayFormat.format(date.toLocal());
  }

  static String dateTime(String? iso) {
    final DateTime? date = _parse(iso);
    return date == null ? _placeholder : _dateTimeFormat.format(date.toLocal());
  }

  static String relative(String? iso) {
    final DateTime? date = _parse(iso);
    if (date == null) return _placeholder;

    final Duration difference = DateTime.now().difference(date.toLocal());
    if (difference.isNegative || difference.inMinutes < 1) return 'just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes} min ago';
    if (difference.inHours < 24) return '${difference.inHours} h ago';
    if (difference.inDays < 7) return '${difference.inDays} d ago';
    return day(iso);
  }

  static String cooldown(int seconds) {
    if (seconds <= 0) return 'no cooldown';
    if (seconds >= 86_400) {
      final int days = seconds ~/ 86_400;
      return days == 1 ? '1 day' : '$days days';
    }
    if (seconds >= 3_600) {
      final int hours = seconds ~/ 3_600;
      return hours == 1 ? '1 h' : '$hours h';
    }
    final int minutes = seconds ~/ 60;
    return minutes <= 1 ? '1 min' : '$minutes min';
  }

  static String capitalise(String? value) {
    if (value == null || value.isEmpty) return _placeholder;
    return '${value[0].toUpperCase()}${value.substring(1)}';
  }

  static DateTime? _parse(String? iso) {
    if (iso == null || iso.isEmpty) return null;
    return DateTime.tryParse(iso);
  }
}

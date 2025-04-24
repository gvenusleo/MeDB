import "package:logger/web.dart";

class Log {
  static final Log _instance = Log._internal();

  factory Log() => _instance;

  Log._internal();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      dateTimeFormat: DateTimeFormat.dateAndTime,
      printEmojis: false,
    ),
  );

  static void d(String message) {
    _logger.d(message);
  }

  static void i(String message) {
    _logger.i(message);
  }

  static void w(String message) {
    _logger.w(message);
  }

  static void e(String message) {
    _logger.e(message);
  }
}

import 'package:intl/intl.dart';
import 'package:open_pass_challenge/core/constants/formatting/format.dart';

extension DateTimeExtensions on DateTime {
  /// logDate
  ///
  /// Método que permite formatear un datetime specifico para utilizar en los logs.
  ///  El tipo de retorno es de tipo String.
  ///
  /// Ejemplo:
  /// ```dartshort
  /// DateTime date = DateTime.now();
  /// String readableDate = date.logDate(); // "2024-08-14 12:34:56"
  /// ```
  String logDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat(dateTimeFormat);
    return formatter.format(now);
  }

  /// isWeekend
  ///
  /// Método que permite saber si una fecha es sábado o domingo.
  ///  El tipo de retorno es de tipo bool.
  ///
  /// Ejemplo:
  /// ```dart
  /// DateTime date = DateTime.now(); // "06/10/24"
  /// bool isWeekend = date.isWeekend(); // true
  /// ```
  bool get isWeekend {
    return this.weekday == DateTime.saturday || this.weekday == DateTime.sunday;
  }
  
  /// toShortDateFormat
  ///
  /// Método que permite formatear un datetime specifico para utilizar en el formato yyyy-mm-dd.
  ///  El tipo de retorno es de tipo String.
  ///
  /// Ejemplo:
  /// ```dartshort
  /// DateTime date = DateTime.now();
  /// String readableDate = date.toShortDateFormat(); // "2024-10-02"
  /// ```
  String toShortDateFormat() {
    final DateFormat formatter = DateFormat(shortDateFormat);
    return formatter.format(this);
  }
}

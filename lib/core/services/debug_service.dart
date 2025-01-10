import 'package:flutter/foundation.dart';
import 'package:open_pass_challenge/core/extension/datetime_extension.dart';

/// DebugService
///
/// Servicio utilizado para loguear información relevante sobre la ejecución
/// del programa.
class DebugService {
  static void debugLog(String log) {
    if (kDebugMode) {
      final DateTime now = DateTime.now();
      print('[Challenge] - [${now.logDate()}] - $log');
    }
  }

  static void debugMap(
      String title, String keyName, String valueName, Map<String, String> map) {
    debugLog('[Challenge] - $title/n');
    map.forEach((String key, String value) {
      debugLog('$keyName: $key - $valueName: $value');
    });
  }

  static void debugException(Object e, StackTrace stackTrace) {
    debugLog('[Challenge] - $e\n$stackTrace');
  }
}

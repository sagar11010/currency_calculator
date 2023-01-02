import 'package:flutter/foundation.dart';
///[Logger] using this class you can manage logs
class Logger {
  static prints(dynamic msg) {
    if (kDebugMode) {
      print(msg);
    }
  }
}

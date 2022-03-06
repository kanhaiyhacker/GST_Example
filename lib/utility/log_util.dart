import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogUtil {
  /// Holds instances of logger to send log messages to the [LogPrinter].
  final Logger _logger = Logger();

  static final JsonEncoder _prettyJsonEncoder = JsonEncoder.withIndent('  ');

  factory LogUtil() {
    return LogUtil._internal();
  }

  LogUtil._internal();

  void printLog({String tag = '!@#', String message = ''}) {
    if (!kReleaseMode) {
      print('$tag: $message');
    }
  }

  void debugPrintLog({String tag = '!@#', String message = ''}) {
    if (!kReleaseMode) {
      debugPrint('$tag: $message');
    }
  }

  void printLogger(
      {String tag = '!@#', String message = '', bool isJson = false}) {
    if (!kReleaseMode) {
      isJson
          ? printPrettyJsonString(tag: tag, jsonString: message)
          : _logger.d('$tag: $message');
    }
  }

  String? prettyString(String? jsonString) {
    if (jsonString == null) return null;
    try {
      return _prettyJsonEncoder.convert(json.decode(jsonString));
    } on Exception catch (e) {
      return 'Unable to parse\n $e';
    }
  }

  /// print json string in human readable
  /// [info] optional prefix of output json
  void printPrettyJsonString({String? jsonString, String tag = '!@#'}) {
    _logger.d('$tag\n${prettyString(jsonString)}');
  }

  void printBigLog({String tag = '!@#', String message = ''}) {
    if (!kReleaseMode) {
      final pattern = RegExp('.{1,800}'); //Setting 800 as size of each chunk
      pattern.allMatches(message).forEach((element) {
        print(element.group(0));
      });
    }
  }
}

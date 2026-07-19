import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// ===============================================================
/// LOGGER
/// ---------------------------------------------------------------
///
/// Simple logger utility.
///
/// Logs are only printed in debug mode.
/// ===============================================================

class Logger {
  Logger._();

  ///==============================================================
  /// Debug
  ///==============================================================

  static void debug(Object? message, {String tag = 'DEBUG'}) {
    if (!kDebugMode) return;

    developer.log(message.toString(), name: tag);
  }

  ///==============================================================
  /// Info
  ///==============================================================

  static void info(Object? message, {String tag = 'INFO'}) {
    if (!kDebugMode) return;

    developer.log(message.toString(), name: tag);
  }

  ///==============================================================
  /// Warning
  ///==============================================================

  static void warning(Object? message, {String tag = 'WARNING'}) {
    if (!kDebugMode) return;

    developer.log('⚠️ $message', name: tag);
  }

  ///==============================================================
  /// Error
  ///==============================================================

  static void error(
    Object? message, {
    String tag = 'ERROR',
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;

    developer.log(
      message.toString(),
      name: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  ///==============================================================
  /// Exception
  ///==============================================================

  static void exception(
    Object exception, {
    StackTrace? stackTrace,
    String tag = 'EXCEPTION',
  }) {
    if (!kDebugMode) return;

    developer.log(
      exception.toString(),
      name: tag,
      error: exception,
      stackTrace: stackTrace,
    );
  }
}

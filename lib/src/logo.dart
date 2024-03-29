import 'package:logo/logo.dart';

class Logo {
  late LogoLogLevel _level;
  late bool _showTime;

  late void Function(String) _logFunction;

  late int _count;

  Logo(LogoLogLevel level) {
    this._level = level;
    this._showTime = false;

    this._logFunction = print;

    this._count = 0;
  }

  int? getCount() {
    return this._count;
  }

  Logo showTime() {
    this._showTime = true;
    return this;
  }

  Logo hideTime() {
    this._showTime = false;
    return this;
  }

  Logo declareLogFunction(void Function(String) logFunction) {
    this._logFunction = logFunction;
    return this;
  }

  LogoLogLevel? getLevel() {
    return this._level;
  }

  Logo setLevel(LogoLogLevel level) {
    this._level = level;
    return this;
  }

  Logo critical(Object? content) {
    if (!this._expect([
      LogoLogLevelType.CRITICAL,
      LogoLogLevelType.ERROR,
      LogoLogLevelType.WARNING,
      LogoLogLevelType.INFO,
      LogoLogLevelType.DEBUG,
      LogoLogLevelType.VERBOSE,
    ])) {
      return this;
    }

    final String quote = getLogQuote(LogoLogLevelType.CRITICAL);
    final String prettified = mergeContent(quote, content, this._getConfig());

    this._logFunction(prettified);
    this._count++;
    return this;
  }

  Logo error(Object? content) {
    if (!this._expect([
      LogoLogLevelType.ERROR,
      LogoLogLevelType.WARNING,
      LogoLogLevelType.INFO,
      LogoLogLevelType.DEBUG,
      LogoLogLevelType.VERBOSE,
    ])) {
      return this;
    }

    final String quote = getLogQuote(LogoLogLevelType.ERROR);
    final String prettified = mergeContent(quote, content, this._getConfig());

    this._logFunction(prettified);
    this._count++;
    return this;
  }

  Logo warning(Object? content) {
    if (!this._expect([
      LogoLogLevelType.WARNING,
      LogoLogLevelType.INFO,
      LogoLogLevelType.DEBUG,
      LogoLogLevelType.VERBOSE,
    ])) {
      return this;
    }

    final String quote = getLogQuote(LogoLogLevelType.WARNING);
    final String prettified = mergeContent(quote, content, this._getConfig());

    this._logFunction(prettified);
    this._count++;
    return this;
  }

  Logo info(Object? content) {
    if (!this._expect([
      LogoLogLevelType.INFO,
      LogoLogLevelType.DEBUG,
      LogoLogLevelType.VERBOSE,
    ])) {
      return this;
    }

    final String quote = getLogQuote(LogoLogLevelType.INFO);
    final String prettified = mergeContent(quote, content, this._getConfig());

    this._logFunction(prettified);
    this._count++;
    return this;
  }

  Logo debug(Object? content) {
    if (!this._expect([
      LogoLogLevelType.DEBUG,
      LogoLogLevelType.VERBOSE,
    ])) {
      return this;
    }

    final String quote = getLogQuote(LogoLogLevelType.DEBUG);
    final String prettified = mergeContent(quote, content, this._getConfig());

    this._logFunction(prettified);
    this._count++;
    return this;
  }

  Logo verbose(Object? content) {
    if (!this._expect([
      LogoLogLevelType.VERBOSE,
    ])) {
      return this;
    }

    final String quote = getLogQuote(LogoLogLevelType.VERBOSE);
    final String prettified = mergeContent(quote, content, this._getConfig());

    this._logFunction(prettified);
    this._count++;
    return this;
  }

  Logo reset() {
    this._count = 0;
    return this;
  }

  bool _expect(List<String> modes) {
    return this._level.level == LogoLogLevelType.ALL ||
        modes.indexOf(this._level.level) != -1;
  }

  PrettifyConfig _getConfig() {
    return PrettifyConfig(
      showTime: this._showTime,
    );
  }
}

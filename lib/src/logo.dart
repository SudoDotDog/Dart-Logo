import 'package:logo/logo.dart';

class Logo {
  LogoLogLevel _level;
  bool _showTime;

  void Function(String) _logFunction;

  Logo(LogoLogLevel level) {
    this._level = level;
    this._showTime = false;

    this._logFunction = print;
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

  LogoLogLevel getLevel() {
    return this._level;
  }

  Logo setLevel(LogoLogLevel level) {
    this._level = level;
    return this;
  }

  Logo critical(String content) {
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
    return this;
  }

  Logo error(String content) {
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
    return this;
  }

  Logo warning(String content) {
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
    return this;
  }

  Logo info(String content) {
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
    return this;
  }

  Logo debug(String content) {
    if (!this._expect([
      LogoLogLevelType.DEBUG,
      LogoLogLevelType.VERBOSE,
    ])) {
      return this;
    }

    final String quote = getLogQuote(LogoLogLevelType.DEBUG);
    final String prettified = mergeContent(quote, content, this._getConfig());

    this._logFunction(prettified);
    return this;
  }

  Logo verbose(String content) {
    if (!this._expect([
      LogoLogLevelType.VERBOSE,
    ])) {
      return this;
    }

    final String quote = getLogQuote(LogoLogLevelType.VERBOSE);
    final String prettified = mergeContent(quote, content, this._getConfig());

    this._logFunction(prettified);
    return this;
  }

  bool _expect(List<String> modes) {
    return this._level == LogoLogLevelType.ALL ||
        modes.indexOf(this._level.level) != -1;
  }

  PrettifyConfig _getConfig() {
    return PrettifyConfig(
      showTime: this._showTime,
    );
  }
}

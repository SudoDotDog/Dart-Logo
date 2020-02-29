import 'package:logo/logo.dart';

class Logo {
  LogoLogLevel _level;
  bool _showTime;

  Logo(LogoLogLevel level) {
    this._level = level;
    this._showTime = false;
  }

  Logo showTime() {
    this._showTime = true;
    return this;
  }

  Logo hideTime() {
    this._showTime = false;
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

    print(prettified);
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

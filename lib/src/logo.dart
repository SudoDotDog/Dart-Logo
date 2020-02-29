import 'package:logo/logo.dart';

class Logo {
  LogoLogLevel _level;

  Logo(LogoLogLevel level) {
    this._level = level;
  }

  LogoLogLevel getLevel() {
    return this._level;
  }

  Logo setLevel(LogoLogLevel level) {
    this._level = level;
    return this;
  }
}

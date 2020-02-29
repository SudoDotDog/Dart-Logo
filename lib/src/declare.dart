class LogoLogLevelType {
  static const String ALL = "ALL";
  static const String VERBOSE = "VERBOSE";
  static const String DEBUG = "DEBUG";
  static const String INFO = "INFO";
  static const String WARNING = "WARNING";
  static const String ERROR = "ERROR";
  static const String CRITICAL = "CRITICAL";
}

class LogoLogLevel {
  final String level;

  LogoLogLevel(this.level);

  factory LogoLogLevel.all() {
    return LogoLogLevel(LogoLogLevelType.ALL);
  }
  factory LogoLogLevel.verbose() {
    return LogoLogLevel(LogoLogLevelType.VERBOSE);
  }
  factory LogoLogLevel.debug() {
    return LogoLogLevel(LogoLogLevelType.DEBUG);
  }
  factory LogoLogLevel.info() {
    return LogoLogLevel(LogoLogLevelType.INFO);
  }
  factory LogoLogLevel.warning() {
    return LogoLogLevel(LogoLogLevelType.WARNING);
  }
  factory LogoLogLevel.error() {
    return LogoLogLevel(LogoLogLevelType.ERROR);
  }
  factory LogoLogLevel.critical() {
    return LogoLogLevel(LogoLogLevelType.CRITICAL);
  }
}

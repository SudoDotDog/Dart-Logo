import 'package:logo/logo.dart';

class PrettifyConfig {
  final bool showTime;

  PrettifyConfig({
    this.showTime = false,
  });
}

String mergeContent(String quote, String content, PrettifyConfig config) {
  if (config.showTime) {
    final DateTime dateTime = DateTime.now();
    final String prettifiedDate = appropriateDateStringWithTime(dateTime);

    return "$quote $prettifiedDate $content";
  }

  return "$quote $content";
}

String getLogQuote(String level) {
  switch (level) {
    case LogoLogLevelType.VERBOSE:
      return '[VERB]';
    case LogoLogLevelType.DEBUG:
      return '[DBUG]';
    case LogoLogLevelType.INFO:
      return '[INFO]';
    case LogoLogLevelType.WARNING:
      return '[WARN]';
    case LogoLogLevelType.ERROR:
      return '[ERRR]';
    case LogoLogLevelType.CRITICAL:
      return '[CRIT]';
  }

  return '[UKWN]';
}

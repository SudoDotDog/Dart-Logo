import 'package:logo/logo.dart';

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

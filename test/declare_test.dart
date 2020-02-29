import 'package:logo/logo.dart';
import 'package:test/test.dart';

void main() {
  group('Log Level Declare', () {
    test('get alias can return word', () {
      final LogoLogLevel verbose = LogoLogLevel.verbose();

      expect(verbose.level, equals(LogoLogLevelType.VERBOSE));
    });
  });
}

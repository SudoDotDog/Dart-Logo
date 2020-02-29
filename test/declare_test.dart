import 'package:logo/logo.dart';
import 'package:test/test.dart';

void main() {
  group('Log Level Declare', () {
    test('get alias can return word', () {
      final String verbose = LogoLogLevel.VERBOSE;

      expect(verbose, equals(verbose));
    });
  });
}

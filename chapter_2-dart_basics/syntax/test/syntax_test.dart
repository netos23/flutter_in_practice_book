import 'package:syntax/syntax.dart' hide test;
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}

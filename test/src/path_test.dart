import 'package:poor_web/src/path.dart';
import 'package:test/test.dart';

void main() {
  group('Path', () {
    test('new Path', () {
      final path = Path(['foo', 'bar.dart']);
      expect('$path', equals('/foo/bar.dart'));
    });

    test('Path.uri', () {
      final path = Path.uri(Uri.parse('http://example.com/foo/bar.dart'));
      expect('$path', equals('/foo/bar.dart'));
    });

    test('Path.current', () {
      final path = Path.current();
      print(path);
      expect('$path', isNotEmpty);
    });
  });
}

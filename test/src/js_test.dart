import 'package:poor_web/src/js.dart';
import 'package:test/test.dart';

void main() {
  group('Any', () {
    test('get function', () {
      Any any = Fn.v0(() {});
      expect(any.function, isA<Fn>());
    });

    test('get function', () {
      Any any = Object();
      expect(any.function, isNull);
    });

    test('get object', () {
      Any any = Object();
      expect(any.object, isA<Object>());
    });

    test('get object', () {
      Any any = String('foo');
      expect(any.object, isNull);
    });

    test('get string', () {
      Any any = String('foo');
      expect(any.string, isA<String>());
    });

    test('get string', () {
      Any any = Object();
      expect(any.string, isNull);
    });

    test('get number', () {
      Any any = Number(1);
      expect(any.number, isA<Number>());
    });

    test('get number', () {
      Any any = Object();
      expect(any.number, isNull);
    });

    test('get boolean', () {
      Any any = Boolean(true);
      expect(any.boolean, isA<Boolean>());
    });

    test('get boolean', () {
      Any any = Object();
      expect(any.boolean, isNull);
    });
  });

  group('String', () {
    test('operator +', () {
      final a = String('Hello, ');
      final b = String('World!');
      expect(a + b, equals(String('Hello, World!')));
    });
  });

  group('Number', () {
    test('operator +', () {
      final a = Number(2);
      final b = Number(3);
      expect(a + b, equals(Number(5)));
    });

    test('operator -', () {
      final a = Number(2);
      final b = Number(3);
      expect(a - b, equals(Number(-1)));
    });

    test('operator *', () {
      final a = Number(2);
      final b = Number(3);
      expect(a * b, equals(Number(6)));
    });

    test('operator /', () {
      final a = Number(2);
      final b = Number(3);
      expect(a / b, equals(Number(0.6666666666666666)));
    });

    test('operator %', () {
      final a = Number(2);
      final b = Number(3);
      expect(a % b, equals(Number(2)));
    });
  });
}

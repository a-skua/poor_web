import 'dart:core' as core;
import 'deps/js_interop_unsafe.dart';
import 'deps/js_interop.dart';

/// Wrap [JSAny]
extension type Any._(JSAny _any) implements JSAny {}

/// [Any] extension
///
/// ```dart
/// Number add(Any a, Any b) => switch ((a.number, b.number)) {
///   (Number a, Number b) => a + b,
///   _ => Number(0),
/// };
/// ```
extension AnyExtension on Any {
  Fn? get function => isA<JSFunction>() ? _any as Fn : null;
  Object? get object => isA<JSObject>() ? _any as Object : null;
  String? get string => isA<JSString>() ? _any as String : null;
  Number? get number => isA<JSNumber>() ? _any as Number : null;
  Boolean? get boolean => isA<JSBoolean>() ? _any as Boolean : null;
}

/// Wrap [JSObject]
///
/// ```dart
/// final obj = Object();
/// obj['key'] = 'value';

/// print(obj['key']); // value
/// print(obj['foo']); // null
/// ```
extension type Object._(JSObject _obj) implements JSObject, Any {
  Object() : _obj = JSObject();

  /// [has]
  ///
  /// ```dart
  /// final obj = Object();
  /// obj.has('key'); // false
  /// ```
  core.bool has(core.String property) => _obj.has(property);

  void operator []=(core.String property, Any? value) => _obj[property] = value;
  Any? operator [](core.String property) =>
      has(property) ? Any._(_obj[property] as JSAny) : null;
}

/// Wrap [JSFunction]
///
/// ```dart
/// final fn = Fn(([a, b, _, _]) => switch ((a?.number, b?.number)) {
///   (Number a, Number b) => a + b,
///   _ => null,
/// });
/// final a = Number(1);
/// final b = Number(2);
/// print(fn.call(a, b)); // 3
/// ```
extension type Fn<
  R extends Any?,
  A1 extends Any?,
  A2 extends Any?,
  A3 extends Any?,
  A4 extends Any?
>._(JSFunction _fn)
    implements JSFunction, Any {
  Fn(Any? Function([Any?, Any?, Any?, Any?]) fn) : _fn = fn.toJS;

  /// `void Function()`
  ///
  /// ```dart
  /// final fn = Fn.v0(() => print('Hello'));
  /// fn.call(); // Hello
  /// ```
  factory Fn.v0(void Function() fn) => Fn(([_, _, _, _]) {
    fn();
    return;
  });

  /// `R Function()`
  ///
  /// ```dart
  /// final fn = Fn.a0(() => String('Hello'));
  /// print(fn.call()); // Hello
  /// ```
  factory Fn.a0(R Function() fn) => Fn(([_, _, _, _]) => fn());

  /// `void Function(A1)`
  ///
  /// ```dart
  /// final a = String('World');
  /// final fn = Fn.v1((String msg) => print('Hello, $msg!'));
  /// fn.call(a); // Hello, World!
  /// ```
  factory Fn.v1(void Function(A1) fn) => Fn(([a, _, _, _]) {
    fn(a as A1);
    return;
  });

  /// `R Function(A1)`
  ///
  /// ```dart
  /// final a = String('World');
  /// final fn = Fn.a1((String msg) => String('Hello, $msg!'));
  /// print(fn.call(a)); // Hello, World!
  /// ```
  factory Fn.a1(R Function(A1) fn) => Fn(([a, _, _, _]) => fn(a as A1));

  /// `void Function(A1, A2)`
  ///
  /// ```dart
  /// final a = Number(1);
  /// final b = Number(2);
  /// final fn = Fn.v2((Number a, Number b) => print('$a + $b = ${a + b}'));
  /// fn.call(a, b); // 1 + 2 = 3
  /// ```
  factory Fn.v2(void Function(A1, A2) fn) => Fn(([a, b, _, _]) {
    fn(a as A1, b as A2);
    return;
  });

  /// `R Function(A1, A2)`
  ///
  /// ```dart
  /// final a = Number(1);
  /// final b = Number(2);
  /// final fn = Fn.a2((Number a, Number b) => a + b);
  /// print('$a + $b = ${fn.call(a, b)}'); // 1 + 2 = 3
  /// ```
  factory Fn.a2(R Function(A1, A2) fn) =>
      Fn(([a, b, _, _]) => fn(a as A1, b as A2));

  /// `void Function(A1, A2, A3)`
  ///
  /// ```dart
  /// final a = Number(1);
  /// final b = Number(2);
  /// final c = Number(3);
  /// final fn = Fn.v3(
  ///   (Number a, Number b, Number c) => print('$a + $b + $c = ${a + b + c}'),
  /// );
  /// fn.call(a, b, c); // 1 + 2 + 3 = 6
  /// ```
  factory Fn.v3(void Function(A1, A2, A3) fn) => Fn(([a, b, c, _]) {
    fn(a as A1, b as A2, c as A3);
    return;
  });

  /// `R Function(A1, A2, A3)`
  ///
  /// ```dart
  /// final a = Number(1);
  /// final b = Number(2);
  /// final c = Number(3);
  /// final fn = Fn.a3((Number a, Number b, Number c) => a + b + c);
  /// print('$a + $b + $c = ${fn.call(a, b, c)}'); // 1 + 2 + 3 = 6
  /// ```
  factory Fn.a3(R Function(A1, A2, A3) fn) =>
      Fn(([a, b, c, _]) => fn(a as A1, b as A2, c as A3));

  /// `void Function(A1, A2, A3, A4)`
  ///
  /// ```dart
  /// final a = Number(1);
  /// final b = Number(2);
  /// final c = Number(3);
  /// final d = Number(4);
  /// final fn = Fn.v4(
  ///   (Number a, Number b, Number c, Number d) => print('$a + $b + $c + $d = ${a + b + c + d}'),
  /// );
  /// fn.call(a, b, c, d); // 1 + 2 + 3 + 4 = 10
  /// ```
  factory Fn.v4(void Function(A1, A2, A3, A4) fn) => Fn(([a, b, c, d]) {
    fn(a as A1, b as A2, c as A3, d as A4);
    return;
  });

  /// `R Function(A1, A2, A3, A4)`
  ///
  /// ```dart
  /// final a = Number(1);
  /// final b = Number(2);
  /// final c = Number(3);
  /// final d = Number(4);
  /// final fn = Fn.a4((Number a, Number b, Number c, Number d) => a + b + c + d);
  /// print('$a + $b + $c + $d = ${fn.call(a, b, c, d)}'); // 1 + 2 + 3 + 4 = 10
  /// ```
  factory Fn.a4(R Function(A1, A2, A3, A4) fn) =>
      Fn(([a, b, c, d]) => fn(a as A1, b as A2, c as A3, d as A4));

  R call([A1? a1, A2? a2, A3? a3, A4? a4]) =>
      switch (_fn.callAsFunction(_fn, a1, a2, a3)) {
            final JSAny any => Any._(any),
            null => null,
          }
          as R;
}

/// Wrap [JSString]
extension type String._(JSString _str) implements JSString, Any {
  // TODO
  String(core.String str) : _str = str.toJS;

  core.String get toDart => _str.toDart;

  String operator +(String str) => _str.add(str) as String;
}

/// Wrap [JSNumber]
extension type Number._(JSNumber _num) implements JSNumber, Any {
  Number(core.num num) : _num = num.toJS;

  core.num get toDart => _num.toDartDouble;
  core.int get toDartInt => _num.toDartInt;
  core.double get toDartDouble => _num.toDartDouble;

  Number operator +(Number num) => _num.add(num) as Number;
  Number operator -(Number num) => _num.subtract(num) as Number;
  Number operator *(Number num) => _num.multiply(num) as Number;
  Number operator /(Number num) => _num.divide(num) as Number;
  Number operator %(Number num) => _num.modulo(num) as Number;
}

/// Wrap [JSBoolean]
extension type Boolean._(JSBoolean _bool) implements JSBoolean, Any {
  Boolean(core.bool bool) : _bool = bool.toJS;

  core.bool get toDart => _bool.toDart;
}

/// Wrap [JSPromise]
extension type Promise<T extends JSAny?>._(JSPromise<T> _promise)
    implements JSPromise<T>, Any {
  Promise(core.Future<T> future) : _promise = future.toJS;
}

/// Wrap [JSArray]
extension type Array<T extends JSAny?>._(JSArray<T> _array)
    implements JSArray<T>, Any {
  Array() : _array = JSArray();
  Array.from(core.List<T> list) : _array = list.toJS;

  core.List<T> get toDart => _array.toDart;
}

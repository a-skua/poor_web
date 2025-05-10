import 'dart:core' as core;
import 'deps/js_interop_unsafe.dart';

import 'deps/js_interop.dart';
export 'deps/js_interop.dart';

/// Wrap [JSAny]
extension type Any._(JSAny _any) implements JSAny {
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
/// ```
extension type Object._(JSObject _obj) implements JSObject, Any {
  Object() : _obj = JSObject();

  /// ```dart
  /// final obj = Object();
  /// obj.has('key'); // false
  /// ```
  core.bool has(core.String property) => _obj.has(property);

  /// ```dart
  /// final obj = Object();
  /// obj['key'] = 'value';
  /// ```
  void operator []=(core.String property, Any? value) => _obj[property] = value;

  /// ```dart
  /// final obj = Object();
  /// print(obj['key']); // null
  ///
  /// obj['key'] = 'value';
  /// print(obj['key']); // 'value'
  /// ```
  Any? operator [](core.String property) =>
      has(property) ? Any._(_obj[property] as JSAny) : null;
}

/// Wrap [JSFunction]
///
/// ```dart
/// final fn = F(() => print('Hello'));
/// fn.call(); // Hello
/// ```
extension type Fn._(JSFunction _fn) implements JSFunction, Any {
  Fn(void Function() fn) : _fn = fn.toJS;

  Fn.v0(void Function() fn) : _fn = fn.toJS;
  Fn.a0(Any? Function() fn) : _fn = fn.toJS;
  Fn.v1(void Function(Any?) fn) : _fn = fn.toJS;
  Fn.a1(Any? Function(Any?) fn) : _fn = fn.toJS;
  Fn.v2(void Function(Any?, Any?) fn) : _fn = fn.toJS;
  Fn.a2(Any? Function(Any?, Any?) fn) : _fn = fn.toJS;
  Fn.v3(void Function(Any?, Any?, Any?) fn) : _fn = fn.toJS;
  Fn.a3(Any? Function(Any?, Any?, Any?) fn) : _fn = fn.toJS;
  Fn.v4(void Function(Any?, Any?, Any?, Any?) fn) : _fn = fn.toJS;
  Fn.a4(Any? Function(Any?, Any?, Any?, Any?) fn) : _fn = fn.toJS;

  Any? call([Any? arg1, Any? arg2, Any? arg3, Any? arg4]) => switch (_fn
      .callAsFunction(_fn, arg1, arg2, arg3, arg4)) {
    final JSAny any => Any._(any),
    null => null,
  };
}

extension type String._(JSString _str) implements JSString, Any {
  // TODO
  String(core.String str) : _str = str.toJS;

  core.String get toDart => _str.toDart;

  String operator +(String str) => _str.add(str) as String;
}

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

extension type Boolean._(JSBoolean _bool) implements JSBoolean, Any {
  Boolean(core.bool bool) : _bool = bool.toJS;

  core.bool get toDart => _bool.toDart;
}

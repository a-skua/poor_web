/// stub
sealed class JSAny extends Object {
  const JSAny._();

  bool isA<T>() => this is T;
}

/// stub
final class JSObject extends JSAny {
  final Map<String, JSAny?> _properties = {};
  JSObject() : super._();

  Object get toDart => this;

  JSAny? operator [](String property) => _properties[property];
  void operator []=(String property, JSAny? value) =>
      _properties[property] = value;
}

extension ObjectExtension on Object {
  JSObject get toJS => JSObject();
}

/// stub
final class JSFunction extends JSObject {
  JSFunction._() : super();

  @override
  Function get toDart => throw UnimplementedError();
}

extension FunctionV0Extension on Function {
  JSFunction get toJS => JSFunction._();
}

/// stub
final class JSString extends JSAny {
  final String _str;
  const JSString._(this._str) : super._();

  String get toDart => throw UnimplementedError();

  JSString add(JSString other) => JSString._(_str + other._str);

  @override
  int get hashCode => _str.hashCode;

  @override
  bool operator ==(Object other) => switch (other) {
    JSString other => _str == other._str,
    _ => false,
  };
}

extension StringExtension on String {
  JSString get toJS => JSString._(this);
}

/// stub
final class JSNumber extends JSAny {
  final num _num;
  const JSNumber._(this._num) : super._();

  int get toDartInt => _num.toInt();
  double get toDartDouble => _num.toDouble();

  JSNumber add(JSNumber other) => JSNumber._(_num + other._num);
  JSNumber subtract(JSNumber other) => JSNumber._(_num - other._num);
  JSNumber multiply(JSNumber other) => JSNumber._(_num * other._num);
  JSNumber divide(JSNumber other) => JSNumber._(_num / other._num);
  JSNumber modulo(JSNumber other) => JSNumber._(_num % other._num);

  @override
  int get hashCode => _num.hashCode;

  @override
  bool operator ==(Object other) => switch (other) {
    JSNumber other => _num == other._num,
    _ => false,
  };
}

extension NumberExtension on num {
  JSNumber get toJS => JSNumber._(this);
}

/// stub
final class JSBoolean extends JSAny {
  final bool _bool;
  const JSBoolean._(this._bool) : super._();

  bool get toDart => _bool;

  @override
  int get hashCode => _bool.hashCode;

  @override
  bool operator ==(Object other) => switch (other) {
    JSBoolean other => _bool == other._bool,
    _ => false,
  };
}

extension JSBooleanExtension on bool {
  JSBoolean get toJS => JSBoolean._(this);
}

/// stub
final class JSPromise<T extends JSAny?> extends JSAny {
  final Future<T> _future;
  JSPromise(this._future) : super._();

  Future<T> get toDart => _future;
}

extension FutureExtension<T extends JSAny?> on Future<T> {
  JSPromise<T> get toJS => JSPromise<T>(this);
}

/// stub
final class JSArray<T extends JSAny?> extends JSAny {
  final List<T> _list;
  JSArray._(this._list) : super._();
  factory JSArray() => JSArray._([]);

  List<T> get toDart => _list;
}

extension ListExtension<T extends JSAny?> on List<T> {
  JSArray<T> get toJS => JSArray<T>._(this);
}

get globalContext => JSObject();

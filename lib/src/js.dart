import 'deps/js_interop.dart';
export 'deps/js_interop.dart';

import 'deps/js_interop_unsafe.dart';
import 'web.dart' show console;

/// Wrap [JSObject]
///
/// ```dart
/// final obj = Object();
/// ```
extension type Object._(JSObject _obj) implements JSObject {
  Object() : _obj = JSObject();

  Object.fromJS(this._obj);

  /// ```dart
  /// final obj = Object();
  /// obj.has('key'); // false
  /// ```
  bool has(String property) => _obj.has(property);

  /// ```dart
  /// final obj = Object();
  /// obj['key'] = F(() => print('Hello'));
  /// obj.call('foo');
  /// ```
  void call(String method) {
    final obj = this[method];
    if (obj == null) {
      console.warn('Method $method not found on object $_obj'.toJS); // TODO
      return;
    }

    (obj as F).call();
  }

  /// ```dart
  /// final obj = Object();
  /// obj['key'] = 'value';
  /// ```
  void operator []=(String property, Object? value) => _obj[property] = value;

  /// ```dart
  /// final obj = Object();
  /// print(obj['key']); // null
  ///
  /// obj['key'] = 'value';
  /// print(obj['key']); // 'value'
  /// ```
  Object? operator [](String property) =>
      has(property) ? Object.fromJS(_obj[property] as JSObject) : null;
}

/// Wrap [JSFunction]
///
/// ```dart
/// final fn = F(() => print('Hello'));
/// fn.call(); // Hello
/// ```
extension type F._(JSFunction _fn) implements JSFunction, Object {
  F(void Function() fn) : _fn = fn.toJS;
  F.fromJS(this._fn);

  void call() => _fn.callAsFunction();
}

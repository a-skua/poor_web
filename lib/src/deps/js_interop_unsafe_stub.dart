import 'js_interop_stub.dart';

/// stub
extension JSObjectUnsafeUtilExtension on JSObject {
  R callMethodVarArgs<R extends JSAny?>(
    JSAny method, [
    List<JSAny?>? arguments,
  ]) =>
      throw UnimplementedError(
        'callMethodVarArgs not implemented in this environment.',
      );

  bool has(String property) =>
      throw UnimplementedError('has not implemented in this environment.');

  R getProperty<R extends JSAny?>(JSAny property) =>
      throw UnimplementedError(
        'getProperty not implemented in this environment.',
      );

  void setProperty(JSAny property, JSAny? value) => ();
}

/// stub
extension JSFunctionUnsafeUtilExtension on JSFunction {
  JSAny? callAsFunction([
    JSAny? this0,
    JSAny? arg1,
    JSAny? arg2,
    JSAny? arg3,
    JSAny? arg4,
  ]) => null;
}

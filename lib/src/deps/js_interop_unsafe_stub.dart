import 'js_interop_stub.dart';

extension JSObjectExtension on JSObject {
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

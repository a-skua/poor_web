import 'web_stub.dart';

extension ObjectToJS on Object {
  JSAny get toJS => this;
}

typedef JSAny = Object;
typedef JSObject = Object;

extension JSObjectUtil on JSObject {
  operator []=(String property, JSAny? value) {}
  JSAny? operator [](String property) => null;
}

typedef JSFunction = Object;

extension JSFunctionUtil on JSFunction {
  void callAsFunction([List<JSAny?>? args]) =>
      throw UnimplementedError(
        'callAsFunction not implemented in this environment.',
      );
}

get globalContext => const Window();

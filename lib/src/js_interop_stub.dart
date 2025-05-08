import 'web_stub.dart';

typedef JSAny = Object;

extension JS on Object {
  JSAny get toJS => this;
}

get globalContext => const Window();

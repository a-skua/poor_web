import 'deps/web.dart' as web;
export 'deps/web.dart';

import 'js.dart';

extension ElementAppendAll on web.Element {
  void appendAll(Iterable<JSAny> elements) {
    for (final element in elements) {
      append(element);
    }
  }
}

extension type Window._(web.Window _window) implements web.Window, Object {
  Object? operator [](String property) => Object.fromJS(_window)[property];

  void operator []=(String property, Object? value) =>
      Object.fromJS(_window)[property] = value;
}

/// Error on Node.js:
///   TypeError: null: type 'JSNull' is not a subtype of type 'JSObject'
Window get window => Window._(globalContext as web.Window);

Window get globalThis => window;

Uri get current => Uri.parse(window.location.href);

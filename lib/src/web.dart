import 'dart:core' as core;
import 'deps/web.dart' as web;
export 'deps/web.dart';

import 'js.dart';

extension ElementAppendAll on web.Element {
  void appendAll(core.Iterable<JSAny> elements) {
    for (final element in elements) {
      append(element);
    }
  }
}

extension type Window._(web.Window _window) implements web.Window, Object {
  Any? operator [](core.String property) => (_window as Object)[property];

  void operator []=(core.String property, Any? value) =>
      (_window as Object)[property] = value;
}

/// Error on Node.js:
///   TypeError: null: type 'JSNull' is not a subtype of type 'JSObject'
Window get window => Window._(globalContext as web.Window);

Window get globalThis => window;

core.Uri get current => core.Uri.parse(window.location.href);

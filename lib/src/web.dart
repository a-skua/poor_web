import 'dart:core' as core;
import 'deps/web.dart' as web;
import 'deps/js_interop.dart';

extension ElementAppendAllExtension on web.Element {
  void appendAll(core.Iterable<JSAny> elements) {
    for (final element in elements) {
      append(element);
    }
  }
}

/// Error on Node.js:
///   TypeError: null: type 'JSNull' is not a subtype of type 'JSObject'
web.Window get window => globalContext as web.Window;

web.Window get globalThis => window;

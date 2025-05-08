import 'dart:js_interop' if (dart.library.io) 'js_interop_stub.dart';
import 'package:web/web.dart' if (dart.library.io) 'web_stub.dart';
export 'package:web/web.dart' if (dart.library.io) 'web_stub.dart';

extension ElementAppendAll on Element {
  void appendAll(Iterable<JSAny> elements) {
    for (final element in elements) {
      append(element);
    }
  }
}

/// Error on Node.js:
///   TypeError: null: type 'JSNull' is not a subtype of type 'JSObject'
Window get window => globalContext as Window;

Uri get current => Uri.parse(window.location.href);

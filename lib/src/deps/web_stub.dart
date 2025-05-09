import 'dart:io';
import 'js_interop_stub.dart';

class Element {
  void append(JSAny element) {}
}

class Location {
  const Location();
  String get href => File('.').absolute.uri.toString();
  get isNull => false;
}

class Window {
  const Window();
  Location get location => const Location();
  get isNull => false;
}

get window => const Window();

class Console {
  const Console();

  void debug(JSAny? message) => print(message);
  void error(JSAny? message) => print(message);
}

get console => const Console();

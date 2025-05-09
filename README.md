<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->
Light [web](https://pub.dev/packages/web) wrapper library.

## Usage

```dart
import 'package:poor_web/poor_web.dart';

void main() {
  final global = globalThis;

  global['foo'] = Object();
  print(global['foo']); // [object Object]
  print(global['baz']); // null
}
```

## Additional information

- [package:poor_web](https://pub.dev/packages/poor_web)
- [package:web](https://pub.dev/packages/web)
- [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

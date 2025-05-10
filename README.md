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
// example/example.dart
import 'package:poor_web/poor_web.dart';

void main() {
  document.querySelector('#example')?.appendAll([
    HTMLHeadingElement.h1()..append(Text('Hello, Example!')),
    HTMLParagraphElement()..append(Text('This is a simple web application.')),
  ]);

  final global = globalThis;

  global['calc'] = Object()..['add'] = Fn.a2((Number a, Number b) => a + b);

  final a = 1;
  final b = 2;
  final c = global['calc']?.object?['add']?.function?.call(
    Number(a),
    Number(b),
  );
  print('$a + $b = $c'); // 1 + 2 = 3

  global['calc']?.object?['print'] = Fn(
    ([a, b, c, _]) => switch ((a?.number, b?.number, c?.number)) {
      (Number a, Number b, Number c) => String('$a + $b = $c'),
      _ => null,
    },
  );
}
```

```html
<!-- example/index.html -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Example</title>
    <script type="module">
      import {
        compileStreaming,
        instantiate,
        invoke,
      } from "./example.mjs";

      const instance = await instantiate(
        compileStreaming(
          fetch(new URL("./example.wasm", import.meta.url)),
        ),
      );

      invoke(instance);

      const a = 1;
      const b = 2;
      const c = calc.add(a, b);
      document.querySelector("#example").append(new Text(calc.print(a, b, c)));
    </script>
  </head>
  <body>
    <main id="example"></main>
  </body>
</html>
```

## Additional information

- [package:poor_web](https://pub.dev/packages/poor_web)
- [package:web](https://pub.dev/packages/web)
- [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

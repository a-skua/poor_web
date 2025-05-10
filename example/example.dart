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

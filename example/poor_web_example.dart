import 'package:poor_web/poor_web.dart';

void main() {
  document
      .querySelector('#app')
      ?.replaceWith(
        HTMLElement.main()..appendAll([
          HTMLHeadingElement.h1()..append(Text('Hello, Dart Web!')),
          HTMLParagraphElement()
            ..append(Text('This is a simple web application.')),
        ]),
      );

  final global = globalThis;
  console.log(global['foo']);

  global['foo'] =
      Object()
        ..['string'] = String('BAR')
        ..['number'] = Number(42)
        ..['boolean'] = Boolean(true)
        ..['function'] = Fn.v1((msg) => print('Hello, $msg!'));
  console.log(global['foo']);

  console.warn(String('calling function'));
  global['foo']?.object?['function']?.function?.call();
  global['foo']?.object?['function']?.function?.call(null);
  global['foo']?.object?['function']?.function?.call(String('World'));
  global['foo']?.object?['function']?.function?.call(Number(3.14));
  global['foo']?.object?['function']?.function?.call(Boolean(true));
  global['foo']?.object?['function']?.function?.call(Boolean(true));

  global['calc'] =
      Object()
        ..['add'] = Fn.v2(
          (a, b) => switch ((a?.number, b?.number)) {
            (Number a, Number b) => print('$a + $b = ${a + b}'),
            _ => print('Invalid arguments: $a, $b'),
          },
        );

  global['calc']?.object?['add']?.function?.call(Number(1), Number(2));
  global['calc']?.object?['add']?.function?.call();
  global['calc']?.object?['add']?.function?.call(String('foo'), Number(2));
}

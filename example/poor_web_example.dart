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

  console.warn(String('e.g. globalThis'));
  {
    final global = globalThis;
    print(global); // [object Window]
  }

  console.warn(String('e.g. Object'));
  {
    final foo =
        Object()
          ..['string'] = String('BAR')
          ..['number'] = Number(42)
          ..['boolean'] = Boolean(true)
          ..['function'] = Fn.v1((String? msg) => print('Hello, $msg!'));
    print(foo); // [object Object]
    print(foo['string']); // BAR
    print(foo['bar']); // null
    foo['function']?.function?.call(String('World')); // Hello, World!
  }

  console.warn(String('e.g. Fn'));
  {
    final fn = Fn(
      ([a, b, _, _]) => switch ((a?.number, b?.number)) {
        (Number a, Number b) => a + b,
        _ => null,
      },
    );
    final a = Number(1);
    final b = Number(2);
    print(fn.call(a, b)); // 3
  }

  console.warn(String('e.g. Fn.v0'));
  {
    final fn = Fn.v0(() => print('Hello'));
    fn.call(); // Hello
  }

  console.warn(String('e.g. Fn.a0'));
  {
    final fn = Fn.a0(() => String('Hello'));
    print(fn.call()); // Hello
  }

  console.warn(String('e.g. Fn.v1'));
  {
    final a = String('World');
    final fn = Fn.v1((String msg) => print('Hello, $msg!'));
    fn.call(a); // Hello, World!
  }

  console.warn(String('e.g. Fn.a1'));
  {
    final a = String('World');
    final fn = Fn.a1((String msg) => String('Hello, $msg!'));
    print(fn.call(a)); // Hello, World!
  }

  console.warn(String('e.g. Fn.v2'));
  {
    final a = Number(1);
    final b = Number(2);
    final fn = Fn.v2((Number a, Number b) => print('$a + $b = ${a + b}'));
    fn.call(a, b); // 1 + 2 = 3
  }

  console.warn(String('e.g. Fn.a2'));
  {
    final a = Number(1);
    final b = Number(2);
    final fn = Fn.a2((Number a, Number b) => a + b);
    print('$a + $b = ${fn.call(a, b)}'); // 1 + 2 = 3
  }

  console.warn(String('e.g. Fn.v3'));
  {
    final a = Number(1);
    final b = Number(2);
    final c = Number(3);
    final fn = Fn.v3(
      (Number a, Number b, Number c) => print('$a + $b + $c = ${a + b + c}'),
    );
    fn.call(a, b, c); // 1 + 2 + 3 = 6
  }

  console.warn(String('e.g. Fn.a3'));
  {
    final a = Number(1);
    final b = Number(2);
    final c = Number(3);
    final fn = Fn.a3((Number a, Number b, Number c) => a + b + c);
    print('$a + $b + $c = ${fn.call(a, b, c)}'); // 1 + 2 + 3 = 6
  }

  console.warn(String('e.g. Fn.v4'));
  {
    final a = Number(1);
    final b = Number(2);
    final c = Number(3);
    final d = Number(4);
    final fn = Fn.v4(
      (Number a, Number b, Number c, Number d) =>
          print('$a + $b + $c + $d = ${a + b + c + d}'),
    );
    fn.call(a, b, c, d); // 1 + 2 + 3 + 4 = 10
  }

  console.warn(String('e.g. Fn.a4'));
  {
    final a = Number(1);
    final b = Number(2);
    final c = Number(3);
    final d = Number(4);
    final fn = Fn.a4((Number a, Number b, Number c, Number d) => a + b + c + d);
    print('$a + $b + $c + $d = ${fn.call(a, b, c, d)}'); // 1 + 2 + 3 + 4 = 10
  }
}

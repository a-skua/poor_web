import 'package:poor_web/poor_web.dart';

void main() {
  document
      .querySelector('#app')
      ?.replaceWith(
        HTMLDivElement()..appendAll([
          HTMLHeadingElement.h1()..append(Text('Hello, Dart Web!')),
          HTMLParagraphElement()
            ..append(Text('This is a simple web application.')),
        ]),
      );

  final global = globalThis;
  print('globalThis = $global');

  print('global.foo = ${global['foo']}');

  print('set global.foo');
  global['foo'] = Object();
  print('global.foo = ${global['foo']}');

  print('set global.bar');
  global['bar'] = F(() => print('Hello, Dart!'));

  print('call global.bar');
  global.call('bar');

  print('call global.baz');
  global.call('baz');
}

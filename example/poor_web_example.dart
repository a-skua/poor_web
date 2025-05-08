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
}

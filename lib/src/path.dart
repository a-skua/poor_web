import './web.dart';

Uri get current => Uri.parse(window.location.href);

/// Path
class Path {
  final List<String> segments;

  Path(this.segments);

  Path.uri(Uri uri) : segments = uri.pathSegments;

  factory Path.current() => Path.uri(current);

  @override
  String toString() => '/${segments.join('/')}';
}

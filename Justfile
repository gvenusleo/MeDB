dev:
    flutter run --dart-define-from-file=./.env

apk:
    flutter build apk --release --dart-define-from-file=./.env

svg:
    dart build_svg.dart
    dart format lib/

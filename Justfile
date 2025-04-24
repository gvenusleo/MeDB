default:
    just --list

dev:
    flutter run

apk:
    flutter build apk

apks:
    flutter build apk --split-per-abi

svg:
    dart build_svg.dart
    dart format lib/

share:
    cd build/app/outputs/flutter-apk && dufs
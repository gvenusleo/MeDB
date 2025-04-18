dev:
    flutter run \
        --dart-define=NocoDbBaseUrl="${NocoDbBaseUrl}" \
        --dart-define=NocoDbToken="${NocoDbToken}" \
        --dart-define=NocoDbTagTableId="${NocoDbTagTableId}" \
        --dart-define=NocoDbDiaryTableId="${NocoDbDiaryTableId}" \
        --dart-define=NocoDbPoemTableId="${NocoDbPoemTableId}" \
        --dart-define=NocoDbLinkTableId="${NocoDbLinkTableId}"

apk:
    flutter build apk --release \
        --dart-define=NocoDbBaseUrl="${NocoDbBaseUrl}" \
        --dart-define=NocoDbToken="${NocoDbToken}" \
        --dart-define=NocoDbTagTableId="${NocoDbTagTableId}" \
        --dart-define=NocoDbDiaryTableId="${NocoDbDiaryTableId}" \
        --dart-define=NocoDbPoemTableId="${NocoDbPoemTableId}" \
        --dart-define=NocoDbLinkTableId="${NocoDbLinkTableId}"

svg:
    dart build_svg.dart
    dart format lib/

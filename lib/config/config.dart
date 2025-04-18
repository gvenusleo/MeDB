class AppConfig {
  static const String baseUrl = String.fromEnvironment('NocoDbBaseUrl');
  static const String token = String.fromEnvironment('NocoDbToken');

  static const String tagTableId = String.fromEnvironment('NocoDbTagTableId');
  static const String diaryTableId = String.fromEnvironment(
    'NocoDbDiaryTableId',
  );
  static const String poemTableId = String.fromEnvironment('NocoDbPoemTableId');
  static const String linkTableId = String.fromEnvironment('NocoDbLinkTableId');
}

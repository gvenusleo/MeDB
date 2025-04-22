import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String baseUrl = dotenv.get('NocoDbBaseUrl');
  static String token = dotenv.get('NocoDbToken');

  static String tagTableId = dotenv.get('NocoDbTagTableId');
  static String diaryTableId = dotenv.get('NocoDbDiaryTableId');
  static String poemTableId = dotenv.get('NocoDbPoemTableId');
  static String linkTableId = dotenv.get('NocoDbLinkTableId');
}

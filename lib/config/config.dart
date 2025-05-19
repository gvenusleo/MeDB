import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String baseUrl = dotenv.get('TeableBaseUrl');
  static String token = dotenv.get('TeableToken');

  static String diaryTableId = dotenv.get('TeableDiaryTableId');
  static String diaryViewId = dotenv.get('TeableDiaryViewId');

  static String poemTableId = dotenv.get('TeablePoemTableId');
  static String poemViewId = dotenv.get('TeablePoemViewId');

  static String linkTableId = dotenv.get('TeableLinkTableId');
  static String linkViewId = dotenv.get('TeableLinkViewId');
}

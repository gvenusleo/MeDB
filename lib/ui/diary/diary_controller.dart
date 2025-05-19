import 'package:medb/common/base_controller.dart';
import 'package:medb/config/config.dart';

class DiaryController extends BaseController {
  @override
  String get tableId => AppConfig.diaryTableId;

  @override
  String get viewId => AppConfig.diaryViewId;

  @override
  String get tag => 'DiaryController';

  @override
  String get readViewRoute => '/diary/read';

  @override
  String get editViewRoute => '/diary/edit';
}

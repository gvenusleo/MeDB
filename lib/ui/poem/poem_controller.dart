import 'package:medb/common/base_controller.dart';
import 'package:medb/config/config.dart';

class PoemController extends BaseController {
  @override
  String get tableId => AppConfig.poemTableId;

  @override
  String get tag => 'PoemController';

  @override
  String get readViewRoute => '/poem/read';

  @override
  String get editViewRoute => '/poem/edit';
}

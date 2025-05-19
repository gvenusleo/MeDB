import 'package:medb/common/base_controller.dart';
import 'package:medb/config/config.dart';

class LinkController extends BaseController {
  @override
  String get tableId => AppConfig.linkTableId;

  @override
  String get viewId => AppConfig.linkViewId;

  @override
  String get tag => 'LinkController';

  @override
  String get editViewRoute => '/link/edit';
}

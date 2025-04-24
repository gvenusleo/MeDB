import 'package:medb/common/base_controller.dart';
import 'package:medb/config/config.dart';

class TagController extends BaseController {
  @override
  String get tableId => AppConfig.tagTableId;

  @override
  String get tag => 'TagController';
}

import 'package:get/get.dart';
import 'package:medb/ui/tag/edit/tag_edit_controller.dart';

class TagEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TagEditController());
  }
}

import 'package:get/get.dart';
import 'package:medb/ui/diary/edit/diary_edit_controller.dart';

class DiaryEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiaryEditController());
  }
}

import 'package:get/get.dart';
import 'package:medb/ui/diary/read/diary_read_controller.dart';

class DiaryReadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiaryReadController());
  }
}

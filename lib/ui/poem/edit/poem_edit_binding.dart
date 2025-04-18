import "package:get/get.dart";
import "package:medb/ui/poem/edit/poem_edit_controller.dart";

class PoemEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PoemEditController());
  }
}

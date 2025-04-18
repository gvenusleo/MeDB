import 'package:get/get.dart';
import 'package:medb/ui/link/edit/link_edit_controller.dart';

class LinkEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinkEditController());
  }
}

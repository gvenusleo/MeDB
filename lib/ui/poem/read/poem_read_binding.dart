import 'package:get/get.dart';
import 'package:medb/ui/poem/read/poem_read_controller.dart';

class PoemReadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PoemReadController());
  }
}

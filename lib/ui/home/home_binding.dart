import 'package:get/get.dart';
import 'package:medb/ui/diary/diary_controller.dart';
import 'package:medb/ui/home/home_controller.dart';
import 'package:medb/ui/poem/poem_controller.dart';
import 'package:medb/ui/link/link_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DiaryController());
    Get.lazyPut(() => PoemController());
    Get.lazyPut(() => LinkController());
  }
}

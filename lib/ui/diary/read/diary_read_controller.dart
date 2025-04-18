import 'package:get/get.dart';

class DiaryReadController extends GetxController {
  late RxMap data;

  @override
  void onInit() {
    super.onInit();
    data = (Get.arguments as Map).obs;
  }

  Future<void> toEdit() async {
    await Get.toNamed('/diary/edit', arguments: data);
    Get.back();
  }
}

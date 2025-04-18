import 'package:get/get.dart';

class PoemReadController extends GetxController {
  late RxMap data;

  @override
  void onInit() {
    super.onInit();
    data = (Get.arguments as Map).obs;
  }

  Future<void> toEdit() async {
    await Get.toNamed('/poem/edit', arguments: data);
    Get.back();
  }
}

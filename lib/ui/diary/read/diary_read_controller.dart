import 'package:get/get.dart';

class DiaryReadController extends GetxController {
  late Map<String, dynamic> data;
  late Map<String, dynamic> dataFields;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments as Map<String, dynamic>;
    dataFields = data['fields'] as Map<String, dynamic>;
  }

  Future<void> toEdit() async {
    await Get.toNamed('/diary/edit', arguments: data);
    Get.back();
  }
}

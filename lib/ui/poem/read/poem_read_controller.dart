import 'package:get/get.dart';

class PoemReadController extends GetxController {
  late Map<String, dynamic> data;
  late Map<String, dynamic> dataFields;

  @override
  void onInit() {
    super.onInit();
    data = (Get.arguments as Map<String, dynamic>).obs;
    dataFields = data['fields'];
  }

  Future<void> toEdit() async {
    await Get.toNamed('/poem/edit', arguments: data);
    Get.back();
  }
}

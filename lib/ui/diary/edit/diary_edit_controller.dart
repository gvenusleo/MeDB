import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medb/config/config.dart';
import 'package:medb/service/teable_service.dart';
import 'package:medb/common/log.dart';

class DiaryEditController extends GetxController {
  late Map<String, dynamic> data;
  late Map<String, dynamic> dataFields;

  late TextEditingController contentController;

  final dbService = Get.find<TeableService>();

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments;
    dataFields = data['fields'] ?? {};
    contentController = TextEditingController(
      text: dataFields['Content'] ?? '',
    );
  }

  Future<void> save() async {
    if (contentController.text.isNotEmpty) {
      dataFields['Content'] = contentController.text;
    }

    Log.d('[DiaryEditController] save: $dataFields');

    try {
      if (data['id'] == null) {
        await dbService.createRecord(AppConfig.diaryTableId, dataFields);
      } else {
        await dbService.updateRecord(
          AppConfig.diaryTableId,
          data['id'],
          dataFields,
        );
      }
      Get.back();
      Fluttertoast.showToast(msg: '保存成功');
    } catch (e) {
      Fluttertoast.showToast(msg: '保存失败');
      Log.e('[DiaryEditController] save: $e');
    }
  }
}

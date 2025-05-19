import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medb/config/config.dart';
import 'package:medb/service/teable_service.dart';
import 'package:medb/common/log.dart';

class LinkEditController extends GetxController {
  late Map<String, dynamic> data;
  late Map<String, dynamic> dataFields;

  late TextEditingController titleController;
  late TextEditingController urlController;

  final dbService = Get.find<TeableService>();

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments;
    dataFields = data['fields'] ?? {};
    titleController = TextEditingController(text: dataFields['Title'] ?? '');
    urlController = TextEditingController(text: dataFields['Url'] ?? '');
  }

  Future<void> save() async {
    if (titleController.text.isNotEmpty) {
      dataFields['Title'] = titleController.text;
    }
    if (urlController.text.isNotEmpty) {
      dataFields['Url'] = urlController.text;
    }

    Log.d('[LinkEditController] save: $dataFields');

    try {
      if (data['id'] == null) {
        await dbService.createRecord(AppConfig.linkTableId, dataFields);
      } else {
        await dbService.updateRecord(
          AppConfig.linkTableId,
          data['id'],
          dataFields,
        );
      }
      Get.back();
      Fluttertoast.showToast(msg: "保存成功");
    } catch (e) {
      Fluttertoast.showToast(msg: "保存失败");
      Log.e('[LinkEditController] save: $e');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medb/config/config.dart';
import 'package:medb/service/teable_service.dart';
import 'package:medb/common/log.dart';

class PoemEditController extends GetxController {
  late Map<String, dynamic> data;
  late Map<String, dynamic> dataFields;

  late TextEditingController titleController;
  late TextEditingController authorController;
  late TextEditingController contentController;
  late TextEditingController noteController;

  final dbService = Get.find<TeableService>();

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments;
    dataFields = data['fields'] ?? {};
    titleController = TextEditingController(text: dataFields['Title'] ?? '');
    authorController = TextEditingController(text: dataFields['Author'] ?? '');
    contentController = TextEditingController(
      text: dataFields['Content'] ?? '',
    );
    noteController = TextEditingController(text: dataFields['Note'] ?? '');
  }

  Future<void> save() async {
    if (titleController.text.isNotEmpty) {
      dataFields['Title'] = titleController.text;
    }
    if (authorController.text.isNotEmpty) {
      dataFields['Author'] = authorController.text;
    }
    if (contentController.text.isNotEmpty) {
      dataFields['Content'] = contentController.text;
    }
    if (noteController.text.isNotEmpty) {
      dataFields['Note'] = noteController.text;
    }

    Log.d('[PoemEditController] save: $dataFields');

    try {
      if (data['id'] == null) {
        await dbService.createRecord(AppConfig.poemTableId, dataFields);
      } else {
        await dbService.updateRecord(
          AppConfig.poemTableId,
          data['id'],
          dataFields,
        );
      }
      Get.back();
      Fluttertoast.showToast(msg: '保存成功');
    } catch (e) {
      Fluttertoast.showToast(msg: '保存失败');
      Log.e('[PoemEditController] save: $e');
    }
  }
}

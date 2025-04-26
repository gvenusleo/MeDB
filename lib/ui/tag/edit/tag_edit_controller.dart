import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medb/common/log.dart';
import 'package:medb/config/config.dart';
import 'package:medb/service/nocodb_service.dart';

class TagEditController extends GetxController {
  late Map tag;

  late TextEditingController titleController;

  final dbService = Get.find<NocoDbService>();

  @override
  void onInit() {
    super.onInit();
    tag = Get.arguments;
    titleController = TextEditingController(text: tag['Title'] ?? '');
  }

  Future<void> save() async {
    final Map<String, dynamic> t = {};
    if (tag['Id'] != null) {
      t['Id'] = tag['Id'];
    }
    if (titleController.text.isNotEmpty) {
      t['Title'] = titleController.text;
    }

    Log.d('[TagEditController] save: $t');

    try {
      if (t['Id'] == null) {
        await dbService.createRecord(AppConfig.tagTableId, t);
      } else {
        await dbService.updateRecord(AppConfig.tagTableId, t);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '保存失败');
      Log.e('[TagEditController] save: $e');
    }
    Get.back();
    Fluttertoast.showToast(msg: '保存成功');
  }
}

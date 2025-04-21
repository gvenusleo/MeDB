import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medb/config/config.dart';
import 'package:medb/service/nocodb_service.dart';
import 'package:medb/utils/log.dart';

class DiaryEditController extends GetxController {
  late Map poem;

  late TextEditingController contentController;

  final dbService = Get.find<NocoDbService>();

  @override
  void onInit() {
    super.onInit();
    poem = Get.arguments;
    contentController = TextEditingController(text: poem['Content'] ?? '');
  }

  Future<void> save() async {
    final Map<String, dynamic> p = {};
    if (poem['Id'] != null) {
      p['Id'] = poem['Id'];
    }
    if (contentController.text.isNotEmpty) {
      p['Content'] = contentController.text;
    }

    Log.d('[DiaryEditController] save: $p');

    try {
      if (p['Id'] == null) {
        await dbService.createRecord(AppConfig.diaryTableId, p);
      } else {
        await dbService.updateRecord(AppConfig.diaryTableId, p);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '保存失败');
      Log.e('[DiaryEditController] save: $e');
    }
    Get.back();
    Fluttertoast.showToast(msg: '保存成功');
  }
}

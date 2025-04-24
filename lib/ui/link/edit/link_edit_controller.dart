import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medb/config/config.dart';
import 'package:medb/service/nocodb_service.dart';
import 'package:medb/common/log.dart';

class LinkEditController extends GetxController {
  late Map link;

  late TextEditingController titleController;
  late TextEditingController urlController;

  final dbService = Get.find<NocoDbService>();

  @override
  void onInit() {
    super.onInit();
    link = Get.arguments;
    titleController = TextEditingController(text: link['Title'] ?? '');
    urlController = TextEditingController(text: link['Url'] ?? '');
  }

  Future<void> save() async {
    final Map<String, dynamic> u = {};
    if (link['Id'] != null) {
      u['Id'] = link['Id'];
    }
    if (titleController.text.isNotEmpty) {
      u['Title'] = titleController.text;
    }
    if (urlController.text.isNotEmpty) {
      u['Url'] = urlController.text;
    }

    Log.d('[LinkEditController] save: $u');

    try {
      if (u['Id'] == null) {
        await dbService.createRecord(AppConfig.linkTableId, u);
      } else {
        await dbService.updateRecord(AppConfig.linkTableId, u);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "保存失败");
      Log.e('[LinkEditController] save: $e');
    }
    Get.back();
    Fluttertoast.showToast(msg: "保存成功");
  }
}

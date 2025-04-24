import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medb/config/config.dart';
import 'package:medb/service/nocodb_service.dart';
import 'package:medb/common/log.dart';

class PoemEditController extends GetxController {
  late Map poem;

  late TextEditingController titleController;
  late TextEditingController authorController;
  late TextEditingController contentController;
  late TextEditingController noteController;

  final dbService = Get.find<NocoDbService>();

  @override
  void onInit() {
    super.onInit();
    poem = Get.arguments;
    titleController = TextEditingController(text: poem['Title'] ?? '');
    authorController = TextEditingController(text: poem['Author'] ?? '');
    contentController = TextEditingController(text: poem['Content'] ?? '');
    noteController = TextEditingController(text: poem['Note'] ?? '');
  }

  Future<void> save() async {
    final Map<String, dynamic> p = {};
    if (poem['Id'] != null) {
      p['Id'] = poem['Id'];
    }
    if (titleController.text.isNotEmpty) {
      p['Title'] = titleController.text;
    }
    if (authorController.text.isNotEmpty) {
      p['Author'] = authorController.text;
    }
    if (contentController.text.isNotEmpty) {
      p['Content'] = contentController.text;
    }
    if (noteController.text.isNotEmpty) {
      p['Note'] = noteController.text;
    }

    Log.d('[PoemEditController] save: $p');

    try {
      if (p['Id'] == null) {
        await dbService.createRecord(AppConfig.poemTableId, p);
      } else {
        await dbService.updateRecord(AppConfig.poemTableId, p);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '保存失败');
      Log.e('[PoemEditController] save: $e');
    }
    Get.back();
    Fluttertoast.showToast(msg: '保存成功');
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/diary/edit/diary_edit_controller.dart';
import 'package:medb/widgets/me_card.dart';
import 'package:medb/widgets/svg.dart';
import 'package:medb/widgets/text_input.dart';

class DiaryEditView extends StatelessWidget {
  const DiaryEditView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<DiaryEditController>();

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Get.theme.colorScheme.surface,
        shadowColor: Get.theme.colorScheme.surface,
        backgroundColor: Get.theme.colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: SvgIcon(assetName: Svg.back),
        ),
        title: Text("人生海海"),
        centerTitle: true,
        actions: [
          TextButton(onPressed: c.save, child: Text("完成")),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: MeCard(
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 4),
            children: [
              TextInput(
                isSingleLine: false,
                label: '内容',
                controller: c.contentController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/diary/read/diary_read_controller.dart';
import 'package:medb/widgets/datetime_tag.dart';
import 'package:medb/widgets/me_card.dart';
import 'package:medb/widgets/svg.dart';
import 'package:medb/widgets/tag_tag.dart';

class DiaryReadView extends StatelessWidget {
  const DiaryReadView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<DiaryReadController>();

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Get.theme.colorScheme.surface,
        shadowColor: Get.theme.colorScheme.surface,
        backgroundColor: Get.theme.colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: Get.back, icon: SvgIcon.back()),
        title: Text('人生海海'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: c.toEdit, icon: SvgIcon.edit(size: 18)),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          physics: const BouncingScrollPhysics(),
          child: SelectionArea(
            child: Obx(
              () => MeCard(
                children: [
                  Text(
                    c.data['Content'] ?? '',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  if (c.data['Tags'] != null) ...[
                    TagTag(label: '标签', value: c.data['Tags'], fontSize: 14),
                  ],
                  if (c.data['UpdatedAt'] != null)
                    DateTimeTag(
                      label: '更新',
                      value: c.data['UpdatedAt'],
                      fontSize: 14,
                    ),
                  if (c.data['CreatedAt'] != null)
                    DateTimeTag(
                      label: '创建',
                      value: c.data['CreatedAt'],
                      fontSize: 14,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

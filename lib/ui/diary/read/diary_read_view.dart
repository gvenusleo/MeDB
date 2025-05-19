import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/diary/read/diary_read_controller.dart';
import 'package:medb/widgets/item_chip.dart';
import 'package:medb/widgets/me_card.dart';
import 'package:medb/widgets/svg.dart';

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
        leading: IconButton(
          onPressed: Get.back,
          icon: SvgIcon(assetName: Svg.back),
        ),
        title: Text('人生海海'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: c.toEdit,
            icon: SvgIcon(assetName: Svg.edit, size: 18),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          physics: const BouncingScrollPhysics(),
          child: SelectionArea(
            child: MeCard(
              children: [
                Text(
                  c.dataFields['Content'] ?? '',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                if (c.dataFields['Tags'] != null) ...[
                  ItemChip(
                    svg: Svg.hash,
                    label: '标签',
                    value: c.dataFields['Tags'],
                    fontSize: 14,
                  ),
                ],
                if (c.dataFields['UpdatedAt'] != null)
                  ItemChip(
                    svg: Svg.datetime,
                    label: '更新',
                    value: c.dataFields['UpdatedAt'],
                    fontSize: 14,
                  ),
                if (c.dataFields['CreatedAt'] != null)
                  ItemChip(
                    svg: Svg.datetime,
                    label: '创建',
                    value: c.dataFields['CreatedAt'],
                    fontSize: 14,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

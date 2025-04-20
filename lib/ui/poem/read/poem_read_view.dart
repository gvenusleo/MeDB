import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/poem/read/poem_read_controller.dart';
import 'package:medb/widgets/item_chip.dart';
import 'package:medb/widgets/me_card.dart';
import 'package:medb/widgets/svg.dart';

class PoemReadView extends StatelessWidget {
  const PoemReadView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PoemReadController>();
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
        title: Text('诗词歌赋'),
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
            child: Obx(
              () => MeCard(
                children: [
                  Text(
                    c.data['Title'] ?? '',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    c.data['Author'] ?? '',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(thickness: 0.5),
                  const SizedBox(height: 12),
                  Text(
                    c.data['Content'] ?? '',
                    textAlign:
                        c.data['Type'] == '诗'
                            ? TextAlign.center
                            : TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  if (c.data['Note'] != null) ...[
                    const SizedBox(height: 12),
                    const Divider(thickness: 0.5),
                    const SizedBox(height: 12),
                    Text(
                      c.data['Note'],
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                  const SizedBox(height: 18),
                  if (c.data['UpdatedAt'] != null)
                    ItemChip(
                      svg: Svg.datetime,
                      label: '更新',
                      value: c.data['UpdatedAt'],
                      fontSize: 12,
                    ),
                  if (c.data['CreatedAt'] != null)
                    ItemChip(
                      svg: Svg.datetime,
                      label: '创建',
                      value: c.data['CreatedAt'],
                      fontSize: 12,
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

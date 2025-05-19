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
            child: MeCard(
              children: [
                Text(
                  c.dataFields['Title'] ?? '',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  c.dataFields['Author'] ?? '',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const Divider(thickness: 0.5),
                const SizedBox(height: 12),
                Text(
                  c.dataFields['Content'] ?? '',
                  textAlign:
                      c.dataFields['Type'] == '诗'
                          ? TextAlign.center
                          : TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                if (c.dataFields['Note'] != null) ...[
                  const SizedBox(height: 12),
                  const Divider(thickness: 0.5),
                  const SizedBox(height: 12),
                  Text(
                    c.dataFields['Note'],
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ],
                const SizedBox(height: 18),
                if (c.dataFields['UpdatedAt'] != null)
                  ItemChip(
                    svg: Svg.datetime,
                    label: '更新',
                    value: c.dataFields['UpdatedAt'],
                    fontSize: 12,
                  ),
                if (c.dataFields['CreatedAt'] != null)
                  ItemChip(
                    svg: Svg.datetime,
                    label: '创建',
                    value: c.dataFields['CreatedAt'],
                    fontSize: 12,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/diary/diary_controller.dart';
import 'package:medb/widgets/item_chip.dart';
import 'package:medb/widgets/me_card.dart';
import 'package:medb/widgets/svg.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<DiaryController>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        onPressed: c.toEditView,
        child: SvgIcon(assetName: Svg.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: SvgIcon(assetName: Svg.layout)),
            IconButton(onPressed: () {}, icon: SvgIcon(assetName: Svg.sort)),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: c.pullfresh,
                  child: ListView.separated(
                    controller: c.scrollController,
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    itemCount: c.records.length,
                    itemBuilder: (context, index) {
                      final Map<String, dynamic> item = c.records[index];
                      final Map<String, dynamic> itemFields = item['fields'];
                      return GestureDetector(
                        onTap: () => c.toReadView(item),
                        child: MeCard(
                          children: [
                            Text(
                              itemFields['Content'],
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,
                              maxLines: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            if (itemFields['Tags'] != null)
                              ItemChip(
                                svg: Svg.hash,
                                label: '标签',
                                value: itemFields['Tags'],
                                fontSize: 12,
                              ),
                            ItemChip(
                              svg: Svg.datetime,
                              label: '时间',
                              value: itemFields['CreatedAt'],
                              fontSize: 12,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(height: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

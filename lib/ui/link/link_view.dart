import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/link/link_controller.dart';
import 'package:medb/widgets/item_chip.dart';
import 'package:medb/widgets/me_card.dart';
import 'package:medb/widgets/svg.dart';

class LinkView extends StatelessWidget {
  const LinkView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<LinkController>();
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
                    itemCount: c.data.length,
                    itemBuilder: (context, index) {
                      final item = c.data[index];
                      return GestureDetector(
                        onTap: () => c.toEditView(item: item),
                        child: MeCard(
                          children: [
                            ItemChip(
                              svg: Svg.text,
                              label: '标题',
                              value: item['Title'],
                            ),
                            ItemChip(
                              svg: Svg.link,
                              label: '链接',
                              value: item['Url'],
                            ),
                            if (item['Tags'] != null)
                              ItemChip(
                                svg: Svg.hash,
                                label: '标签',
                                value: item['Tags'],
                              ),
                            item['UpdatedAt'] == null
                                ? ItemChip(
                                  svg: Svg.datetime,
                                  label: '更新',
                                  value: item['CreatedAt'],
                                )
                                : ItemChip(
                                  svg: Svg.datetime,
                                  label: '更新',
                                  value: item['UpdatedAt'],
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

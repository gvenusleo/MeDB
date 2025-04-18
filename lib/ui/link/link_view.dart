import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/link/link_controller.dart';
import 'package:medb/widgets/datetime_tag.dart';
import 'package:medb/widgets/link_tag.dart';
import 'package:medb/widgets/svg.dart';
import 'package:medb/widgets/tag_tag.dart';
import 'package:medb/widgets/text_tag.dart';

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
        onPressed: () => c.toEditView({}),
        child: SvgIcon.add(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: SvgIcon.layout()),
            IconButton(onPressed: () {}, icon: SvgIcon.sort()),
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
                    physics: const BouncingScrollPhysics(),
                    itemCount: c.data.length,
                    itemBuilder: (context, index) {
                      final item = c.data[index];
                      return GestureDetector(
                        onTap: () => c.toEditView(item),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Get.theme.colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextTag(label: '标题', value: item['Title']),
                              LinkTag(label: '链接', value: item['Url']),
                              if (item['Tags'] != null)
                                TagTag(label: '标签', value: item['Tags']),
                              item['UpdatedAt'] == null
                                  ? DateTimeTag(
                                    label: '更新',
                                    value: item['CreatedAt'],
                                  )
                                  : DateTimeTag(
                                    label: '更新',
                                    value: item['UpdatedAt'],
                                  ),
                            ],
                          ),
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

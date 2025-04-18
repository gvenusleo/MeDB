import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/poem/poem_controller.dart';
import 'package:medb/widgets/datetime_tag.dart';
import 'package:medb/widgets/svg.dart';
import 'package:medb/widgets/text_tag.dart';

class PoemView extends StatelessWidget {
  const PoemView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PoemController>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        onPressed: c.toEditView,
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
                        onTap: () => c.toReadView(item),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Get.theme.colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['Title'],
                                style: TextStyle(fontSize: 18),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              TextTag(label: '作者', value: item['Author']),
                              TextTag(label: '内容', value: item['Content']),
                              if (item['Note'] != null)
                                TextTag(label: '笔记', value: item['Note']),
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

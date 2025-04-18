import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/diary/diary_controller.dart';
import 'package:medb/widgets/datetime_tag.dart';
import 'package:medb/widgets/svg.dart';
import 'package:medb/widgets/tag_tag.dart';

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
                                item['Content'],
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.justify,
                                maxLines: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              if (item['Tags'] != null)
                                TagTag(
                                  label: '标签',
                                  value: item['Tags'],
                                  fontSize: 12,
                                ),
                              DateTimeTag(
                                label: '时间',
                                value: item['CreatedAt'],
                                fontSize: 12,
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

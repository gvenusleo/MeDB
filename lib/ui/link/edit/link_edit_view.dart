import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/link/edit/link_edit_controller.dart';
import 'package:medb/widgets/link_input.dart';
import 'package:medb/widgets/me_card.dart';
import 'package:medb/widgets/svg.dart';
import 'package:medb/widgets/text_input.dart';

class LinkEditView extends StatelessWidget {
  const LinkEditView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<LinkEditController>();
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
        title: Text("网页链接"),
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
                isSingleLine: true,
                label: '标题',
                controller: c.titleController,
              ),
              const Divider(height: 24, thickness: 0.5),
              LinkInput(label: '链接', controller: c.urlController),
            ],
          ),
        ),
      ),
    );
  }
}

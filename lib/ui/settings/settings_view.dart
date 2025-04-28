import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/settings/settings_controller.dart';
import 'package:medb/widgets/me_card.dart';
import 'package:medb/widgets/svg.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SettingsController>();
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
        title: Text("应用设置"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              MeCard(
                padding: const EdgeInsets.all(0),
                children: [
                  ListTile(
                    leading: SvgIcon(assetName: Svg.moon, size: 20),
                    title: const Text('暗色模式'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('跟随系统'),
                        SvgIcon(assetName: Svg.chevron, size: 20),
                      ],
                    ),
                    onTap: () {},
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  ListTile(
                    leading: SvgIcon(assetName: Svg.palette, size: 20),
                    title: const Text('主题颜色'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('绿野仙踪'),
                        SvgIcon(assetName: Svg.chevron, size: 20),
                      ],
                    ),
                    onTap: () {},
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

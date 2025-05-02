import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/settings/settings_controller.dart';
import 'package:medb/widgets/me_card.dart';
import 'package:medb/widgets/svg.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey darkModeKey = GlobalKey();
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
                    key: darkModeKey,
                    leading: SvgIcon(assetName: Svg.moon, size: 18),
                    title: const Text('暗色模式'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(
                          () =>
                              Text(["亮色模式", "暗色模式", "跟随系统"][c.themeMode.value]),
                        ),
                        SvgIcon(assetName: Svg.chevron, size: 18),
                      ],
                    ),
                    onTap: () {
                      final RenderBox renderBox =
                          darkModeKey.currentContext!.findRenderObject()
                              as RenderBox;
                      final offset = renderBox.localToGlobal(Offset.zero);
                      showMenu(
                        context: context,
                        position: RelativeRect.fromRect(
                          Rect.fromPoints(
                            offset.translate(renderBox.size.width, 0),
                            offset.translate(
                              renderBox.size.width * 2,
                              offset.dy + renderBox.size.height,
                            ),
                          ),
                          Offset.zero & MediaQuery.of(context).size,
                        ),
                        initialValue: c.themeMode.value,
                        items: [
                          PopupMenuItem(
                            value: 0,
                            child: Text('亮色模式'),
                            onTap: () => c.changeThemeMode(0),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: Text('暗色模式'),
                            onTap: () => c.changeThemeMode(1),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text('跟随系统'),
                            onTap: () => c.changeThemeMode(2),
                          ),
                        ],
                      );
                    },
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  const Divider(
                    height: 0,
                    thickness: 0.5,
                    indent: 12,
                    endIndent: 12,
                  ),
                  ListTile(
                    leading: SvgIcon(assetName: Svg.palette, size: 18),
                    title: const Text('主题颜色'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('绿野仙踪'),
                        SvgIcon(assetName: Svg.chevron, size: 18),
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

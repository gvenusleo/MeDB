import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/ui/home/home_controller.dart';
import 'package:medb/widgets/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Get.theme.colorScheme.surface,
        shadowColor: Get.theme.colorScheme.surface,
        backgroundColor: Get.theme.colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Obx(
          () => Text(c.tables.keys.toList()[c.currentTableIndex.value]),
        ),
        centerTitle: true,
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: SvgIcon(assetName: Svg.menu),
              ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: SvgIcon(assetName: Svg.search)),
          const SizedBox(width: 4),
        ],
      ),
      drawerEdgeDragWidth: Get.mediaQuery.size.width * 0.75,
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('MeDB ', style: Get.theme.textTheme.titleLarge),
                    Text('with Teable', style: Get.theme.textTheme.titleSmall),
                  ],
                ),
              ),
              const Divider(thickness: 0.5, indent: 12, endIndent: 12),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  itemCount: c.tables.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: c.tables.values.elementAt(index),
                      title: Text(c.tables.keys.toList()[index]),
                      onTap: () => c.onTableChanged(index),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(96),
                      ),
                      selected: c.currentTableIndex.value == index,
                      selectedTileColor:
                          Get.theme.colorScheme.surfaceContainerHigh,
                      selectedColor: Get.theme.colorScheme.onSurface,
                    );
                  },
                ),
              ),
              const Divider(thickness: 0.5, indent: 12, endIndent: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListTile(
                  leading: SvgIcon(assetName: Svg.settings, size: 20),
                  title: const Text('应用设置'),
                  onTap: c.toSettingsView,
                  tileColor: Get.theme.colorScheme.surfaceContainerHigh,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
      body: Obx(() => c.views[c.currentTableIndex.value]),
    );
  }
}

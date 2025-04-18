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
                icon: SvgIcon.menu(),
              ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: SvgIcon.search()),
          const SizedBox(width: 4),
        ],
      ),
      drawerEdgeDragWidth: Get.mediaQuery.size.width * 0.75,
      drawerEnableOpenDragGesture: true,
      drawer: Obx(
        () => NavigationDrawer(
          selectedIndex: c.currentTableIndex.value,
          onDestinationSelected: c.onTableChanged,
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
                  Text('with NocoDB', style: Get.theme.textTheme.titleSmall),
                ],
              ),
            ),
            const Divider(thickness: 0.5, indent: 12, endIndent: 12),
            const SizedBox(height: 12),
            for (MapEntry item in c.tables.entries)
              NavigationDrawerDestination(
                icon: item.value,
                label: Text(item.key),
              ),
          ],
        ),
      ),
      body: Obx(() => c.views[c.currentTableIndex.value]),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medb/ui/diary/diary_view.dart';
import 'package:medb/ui/link/link_view.dart';
import 'package:medb/ui/poem/poem_view.dart';
import 'package:medb/widgets/svg.dart';

class HomeController extends GetxController {
  // Drawer 数据表
  final Map<String, Widget> tables = {
    '人生海海': SvgIcon.atom(size: 16),
    '诗词歌赋': SvgIcon.box(size: 16),
    '网页链接': SvgIcon.link(size: 16),
  };

  // 主页视图
  final List<Widget> views = [
    const DiaryView(),
    const PoemView(),
    const LinkView(),
  ];

  // Drawer 当前选中的表
  RxInt currentTableIndex = 0.obs;

  /// 通过 Drawer 切换数据表
  void onTableChanged(int index) {
    currentTableIndex.value = index;
    Get.back();
  }
}

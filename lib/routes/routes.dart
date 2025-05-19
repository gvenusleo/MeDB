import 'package:get/get.dart';
import 'package:medb/ui/diary/edit/diary_edit_binding.dart';
import 'package:medb/ui/diary/edit/diary_edit_view.dart';
import 'package:medb/ui/diary/read/diary_read_binding.dart';
import 'package:medb/ui/diary/read/diary_read_view.dart';
import 'package:medb/ui/home/home_binding.dart';
import 'package:medb/ui/home/home_view.dart';
import 'package:medb/ui/link/edit/link_edit_binding.dart';
import 'package:medb/ui/link/edit/link_edit_view.dart';
import 'package:medb/ui/poem/edit/poem_edit_binding.dart';
import 'package:medb/ui/poem/edit/poem_edit_view.dart';
import 'package:medb/ui/poem/read/poem_read_binding.dart';
import 'package:medb/ui/poem/read/poem_read_view.dart';
import 'package:medb/ui/settings/settings_binding.dart';
import 'package:medb/ui/settings/settings_view.dart';

class AppRoutes {
  static final String initial = '/';

  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => const HomeView(), binding: HomeBinding()),
    GetPage(
      name: '/diary/read',
      page: () => const DiaryReadView(),
      binding: DiaryReadBinding(),
    ),
    GetPage(
      name: '/diary/edit',
      page: () => const DiaryEditView(),
      binding: DiaryEditBinding(),
    ),
    GetPage(
      name: '/poem/read',
      page: () => const PoemReadView(),
      binding: PoemReadBinding(),
    ),
    GetPage(
      name: '/poem/edit',
      page: () => const PoemEditView(),
      binding: PoemEditBinding(),
    ),
    GetPage(
      name: '/link/edit',
      page: () => const LinkEditView(),
      binding: LinkEditBinding(),
    ),
    GetPage(
      name: '/settings',
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}

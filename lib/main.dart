import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:medb/service/nocodb_service.dart';
import 'package:medb/service/prefs_service.dart';
import 'package:medb/routes/routes.dart';
import 'package:medb/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Android 开启沉浸式模式
  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  // 加载 .env 文件
  await dotenv.load(fileName: ".env");

  // 初始化全局服务
  await Get.putAsync(() => PrefsService().init());
  Get.put(NocoDbService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MeDB",
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale("zh", "CN"), const Locale("en", "US")],
      locale: const Locale("zh", "CN"),
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      defaultTransition: Transition.cupertino,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.initial,
    );
  }
}

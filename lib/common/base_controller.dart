import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medb/common/log.dart';
import 'package:medb/service/teable_service.dart';

class BaseController extends GetxController {
  late ScrollController scrollController;
  final RxList records = [].obs;
  final RxInt skip = 0.obs;
  final int take = 20;
  final RxBool isLastPage = false.obs;

  final dbService = Get.find<TeableService>();
  final String tableId = '';
  final String viewId = '';
  final String tag = 'BaseController'; // 用于日志输出的标签

  final String readViewRoute = '';
  final String editViewRoute = '';

  @override
  void onInit() {
    super.onInit();

    // 初始化 ScrollController
    scrollController = ScrollController();
    // 当滚动到底部时加载更多数据
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });

    // 初始化数据
    fetchData();
  }

  /// 获取数据
  Future<void> fetchData() async {
    try {
      final res = await dbService.getRecords(
        tableId,
        viewId: viewId,
        skip: skip.value,
        take: take,
        orderBy: '[{"fieldId":"CreatedAt","order":"desc"}]',
      );
      isLastPage.value = res['records'].length < take;
      if (skip.value == 0) {
        records.value = res['records'];
      } else {
        records.addAll(res['records']);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "加载失败");
      Log.e('[$tag] fetchData: $e');
    }
  }

  /// 下拉刷新
  Future<void> pullfresh() async {
    skip.value = 0;
    isLastPage.value = false;
    await fetchData();
    Fluttertoast.showToast(msg: "更新成功");
  }

  /// 上拉加载更多
  void loadMore() {
    Log.d('[$tag] loadMore: skip = $skip, isLastPage = $isLastPage');
    if (isLastPage.value) {
      Fluttertoast.showToast(msg: "已加载全部数据");
      return;
    }
    skip.value += take;
    fetchData();
  }

  /// 跳转到阅读页面
  void toReadView(dynamic item) {
    if (readViewRoute.isEmpty) return;
    Get.toNamed(readViewRoute, arguments: item);
  }

  /// 跳转到编辑页面添加数据
  Future<void> toEditView({dynamic item}) async {
    await Get.toNamed(editViewRoute, arguments: item ?? <String, dynamic>{});

    // 返回后刷新数据
    skip.value = 0;
    isLastPage.value = false;
    await fetchData();
    Fluttertoast.showToast(msg: "已更新数据");
  }
}

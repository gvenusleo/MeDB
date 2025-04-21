import 'package:dio/dio.dart';
import 'package:get/get.dart' show GetxService;
import 'package:medb/config/config.dart';

class NocoDbService extends GetxService {
  static late final Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {
          'xc-token': AppConfig.token,
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  /// 获取所有数据
  Future<dynamic> getRecords(
    String tableId, {
    int offset = 0,
    int limit = 25,
    String sort = '',
    String where = '',
    String viewId = '',
  }) async {
    final String path = '/api/v2/tables/$tableId/records';
    final res = await _get(
      path,
      query: {
        'offset': offset,
        'limit': limit,
        'sort': sort,
        'where': where,
        'viewId': viewId,
      },
    );
    return res.data;
  }

  /// 添加一条数据，返回 Id
  Future<int> createRecord(String tableId, Map<String, dynamic> data) async {
    final String path = '/api/v2/tables/$tableId/records';
    final res = await _post(path, data: data);
    return res.data['Id'];
  }

  /// 更新一条数据，返回 Id
  Future<int> updateRecord(String tableId, Map<String, dynamic> data) async {
    final String path = '/api/v2/tables/$tableId/records';
    final res = await patch(path, data: data);
    return res.data['Id'];
  }

  Future<Response> _get(String path, {dynamic query}) async {
    return _dio.get(path, queryParameters: query);
  }

  Future<Response> _post(String path, {dynamic data}) async {
    return _dio.post(path, data: data);
  }

  Future<Response> patch(String path, {dynamic data}) async {
    return _dio.patch(path, data: data, queryParameters: data);
  }
}

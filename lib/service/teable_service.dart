import 'package:dio/dio.dart';
import 'package:get/get.dart' show GetxService;
import 'package:medb/config/config.dart';

class TeableService extends GetxService {
  static late final Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {
          'Authorization': 'Bearer ${AppConfig.token}',
          'Accept': 'application/json',
        },
      ),
    );
  }

  /// 获取所有数据
  Future<dynamic> getRecords(
    String tableId, {
    String viewId = '',
    int skip = 0,
    int take = 20,
    String fieldKeyType = 'name',
    String cellFormat = 'json',
    String orderBy = '',
    String filter = '',
  }) async {
    final String path = '/api/table/$tableId/record';
    final Map<String, dynamic> query = {
      'viewId': viewId,
      'skip': skip,
      'take': take,
      'fieldKeyType': fieldKeyType,
      'cellFormat': cellFormat,
    };
    if (orderBy.isNotEmpty) {
      query['orderBy'] = orderBy;
    }
    if (filter.isNotEmpty) {
      query['filter'] = filter;
    }
    final res = await _get(path, query: query);
    return res.data;
  }

  /// 添加一条数据，返回 Id
  Future<String> createRecord(String tableId, Map<String, dynamic> data) async {
    final String path = '/api/table/$tableId/record';
    final Map<String, dynamic> body = {
      'records': [
        {'fields': data},
      ],
      'fieldKeyType': 'name',
      'typecast': true,
    };
    final res = await _post(path, data: body);
    return res.data['records'][0]['id'];
  }

  /// 更新一条数据，返回 Id
  Future<String> updateRecord(
    String tableId,
    String recordId,
    Map<String, dynamic> data,
  ) async {
    final String path = '/api/table/$tableId/record/$recordId';
    final Map<String, dynamic> body = {
      'record': {'fields': data},
      'fieldKeyType': 'name',
      'typecast': true,
    };
    final res = await patch(path, data: body);
    return res.data['id'];
  }

  Future<Response> _get(String path, {dynamic query}) async {
    return _dio.get(path, queryParameters: query);
  }

  Future<Response> _post(String path, {dynamic data}) async {
    return _dio.post(path, data: data);
  }

  Future<Response> patch(String path, {dynamic data}) async {
    return _dio.patch(path, data: data);
  }
}

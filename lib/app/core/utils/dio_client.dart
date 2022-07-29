import 'package:dio/dio.dart';

import 'package:ifroom/app/core/constants/app_consts.dart';

abstract class HttpClient {
  Future<Response> post(
      {required String router, Map<String, dynamic> data = const {}});
  Future<Response> get({required String router});
}

class DioClient implements HttpClient {
  final Dio dio;

  DioClient(this.dio);
  @override
  Future<Response> post(
      {required String router, Map<String, dynamic> data = const {}}) async {
    final response = await dio.post(AppConsts.apiUrl + router, data: data);
    return response;
  }

  @override
  Future<Response> get({required String router}) async {
    // dio.options = BaseOptions(baseUrl: AppConsts.apiUrl, );
    final response = await dio.get(AppConsts.apiUrl + router);
    return response;
  }
}

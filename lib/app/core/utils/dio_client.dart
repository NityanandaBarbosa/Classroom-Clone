import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ifroom/app/core/constants/app_consts.dart';

abstract class HttpClient {
  Future<Response> post(
      {required String route, Map<String, dynamic> data = const {}});
  Future<Response> get({required String route});
}

class DioClient implements HttpClient {
  final Dio dio;

  DioClient(this.dio);
  @override
  Future<Response> post(
      {required String route, Map<String, dynamic> data = const {}}) async {
    try {
      final response = await dio.post(AppConsts.apiUrl + route, data: data);
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 403) {
        Modular.to.popUntil(ModalRoute.withName('/'));
      }
      rethrow;
    }
  }

  @override
  Future<Response> get({required String route}) async {
    try {
      final response = await dio.get(AppConsts.apiUrl + route);
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 403) {
        Modular.to.popUntil(ModalRoute.withName('/'));
      }
      rethrow;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifroom/app/core/errors/token_expired_or_invalid.dart';
import 'package:ifroom/app/core/stores/auth_store.dart';

abstract class HttpClient {
  Future<Response> post(
      {required String route, Map<String, dynamic> data = const {}});
  Future<Response> get({required String route});
}

class DioClient implements HttpClient {
  final Dio dio;
  final AuthStore authStore;

  DioClient(this.dio, this.authStore);

  Options get headers => Options(
        headers: {'Authorization': authStore.accessToken},
      );

  Future<void> redirectToLogin(DioError error) async {
    if (error.response?.statusCode == 498) {
      authStore.setError(TokenExpiredOrInvalid());
      await Future.delayed(const Duration(seconds: 4));
      Modular.to.popUntil(ModalRoute.withName('/'));
    }
  }

  @override
  Future<Response> post(
      {required String route, Map<String, dynamic> data = const {}}) async {
    try {
      final response = await dio.post(
        route,
        data: data,
        options: headers,
      );
      return response;
    } on DioError catch (e) {
      redirectToLogin(e);
      rethrow;
    }
  }

  @override
  Future<Response> get({required String route}) async {
    try {
      final response = await dio.get(
        route,
        options: headers,
      );
      return response;
    } on DioError catch (e) {
      redirectToLogin(e);
      rethrow;
    }
  }
}

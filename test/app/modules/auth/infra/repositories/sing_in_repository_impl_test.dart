import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifroom/app/modules/auth/domain/entities/access_token.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_in_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_in_errors.dart';
import 'package:ifroom/app/modules/auth/infra/datasources/sing_in_data_source.dart';
import 'package:ifroom/app/modules/auth/infra/errors/sing_in_data_source_exception.dart';
import 'package:ifroom/app/modules/auth/infra/repositories/sing_in_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class SingInDataSourceMock extends Mock implements SingInDataSource {}

void main() {
  final dataSource = SingInDataSourceMock();
  final repository = SingInRepositoryImpl(dataSource);
  final params = SingInParams("teste@gmail.com", "Teste123");
  final accessToken = AccessToken("asdasdsadasd", DateTime.now());
  test('Should return a AccessToken', () async {
    when(() => dataSource.userSingIn(params))
        .thenAnswer((_) async => accessToken);
    final result = await repository.userSingIn(params);
    expect(result.fold(id, id), isA<AccessToken>());
  });

  group("DataSource Exceptions -", () {
    final requestOptions = RequestOptions(path: '');
    test('Throw a DioError status 401', () async {
      when(() => dataSource.userSingIn(params)).thenThrow(DioError(
          response: Response(requestOptions: requestOptions, statusCode: 401),
          requestOptions: requestOptions));
      final result = await repository.userSingIn(params);
      expect(result.fold(id, id), isA<SingInException>());
    });

    test('Throw a SingInDataSourceException', () async {
      when(() => dataSource.userSingIn(params))
          .thenThrow(SingInDataSourceException());
      final result = await repository.userSingIn(params);
      expect(result.fold(id, id), isA<SingInException>());
    });

    test(
        'Throw a DioError whenever return a statusCode different from 200 or 401',
        () async {
      when(() => dataSource.userSingIn(params)).thenThrow(DioError(
          response: Response(requestOptions: requestOptions, statusCode: 500),
          requestOptions: requestOptions));
      final result = await repository.userSingIn(params);
      expect(result.fold(id, id), isA<SingInException>());
    });
    test('Throw a exception', () async {
      when(() => dataSource.userSingIn(params)).thenThrow(Exception());
      final result = await repository.userSingIn(params);
      expect(result.fold(id, id), isA<SingInException>());
    });
  });
}

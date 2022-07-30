import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_up_errors.dart';
import 'package:ifroom/app/modules/auth/infra/datasources/sing_up_datasource.dart';
import 'package:ifroom/app/modules/auth/infra/errors/sing_up_infra_errors.dart';
import 'package:ifroom/app/modules/auth/infra/repositories/sing_up_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class SingUpDataSourceMock extends Mock implements SingUpDataSource {}

void main() {
  final datasourceMock = SingUpDataSourceMock();
  final repository = SingUpRepositoryImpl(datasourceMock);

  final params = SingUpParams(
      email: "teste@teste.com",
      password: "Teste123",
      name: "Testador Pereira");

  final signedUserInfo = SingedUser(
      id: 1,
      email: "teste@teste.com",
      password: "Teste123",
      name: "Testador Pereira");

  test('Should return a SingedUser', () async {
    when(() => datasourceMock.userSingUp(params))
        .thenAnswer((invocation) async => signedUserInfo);
    final result = await repository.userSingUp(params);
    expect(result.fold(id, id), isA<SingedUser>());
  });

  group("Exceptions -", () {

    test('Should throw a EmailAlreadyUsed', () async {
      when(() => datasourceMock.userSingUp(params))
          .thenThrow(DioError(requestOptions: RequestOptions(path: '/',), response: Response(statusCode: 406, requestOptions: RequestOptions(path: '/',))));
      final result = await repository.userSingUp(params);
      expect(result.fold(id, id), isA<EmailAlreadyUsed>());
    });

    test('Should throw a DataSourceError', () async {
      when(() => datasourceMock.userSingUp(params)).thenThrow(DataSourceError());
      final result = await repository.userSingUp(params);
      expect(result.fold(id, id), isA<DataSourceError>());
    });

    test('Should throw a generic Exception', () async {
      when(() => datasourceMock.userSingUp(params)).thenThrow(Exception());
      final result = await repository.userSingUp(params);
      expect(result.fold(id, id), isA<DataSourceError>());
    });
  });
  
}

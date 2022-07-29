import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:ifroom/app/modules/auth/external/datasources/api_sing_up_datasource.dart';
import 'package:ifroom/app/modules/auth/infra/adapters/adapters.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio{}

void main() {
  final dio = DioMock();
  final datasource = ApiSingUpDatasource(dio);
  final params = SingUpParams(
      email: "teste@gmail.com",
      password: "123",
      userFullName: "Testador Pereira");
  final dataResponse = <String, dynamic>{
    "id": 1,
    "email": "teste@gmail.com",
    "password": "123",
    "userFullName": "Testador Pereira"
  };
  test('Should return a SingedUser', () async {
    when(() => dio.post('', data:'')).thenAnswer((_) async => Response(data: dataResponse, requestOptions: RequestOptions(path: '')));
    // when(() => dio.post(any(), data: params)).thenAnswer((_) async =>
    //     Response(
    //         data: dataResponse,
    //         statusCode: 200,
    //         requestOptions: RequestOptions(path: "")));
    // .thenAnswer(Response(
    //     data: dataResponse,
    //     statusCode: 200,
    //     requestOptions: RequestOptions(path: any())));
    final response = await datasource.userSingUp(params);
    print(response.userFullName);
    // expect(response, isA<SingedUser>());
  });
}

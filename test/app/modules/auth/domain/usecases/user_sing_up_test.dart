import 'package:flutter_test/flutter_test.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/errors.dart';
import 'package:ifroom/app/modules/auth/domain/repositories/sing_up_repository.dart';
import 'package:ifroom/app/modules/auth/domain/usecases/user_sing_up.dart.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class SingRepositoryMock extends Mock implements SingUpRepository {}

void main() {
  final mockRepository = SingRepositoryMock();
  final usercase = UserSingUpImpl(mockRepository);
  final succesUser = SingedUser(
      id: 1,
      email: "teste@teste.com",
      password: "teste123",
      userFullName: "Testador Pereira");

  test('Success singup', () async {
    final userInfo = SingUpUser(
        email: "teste@teste.com",
        password: "teste123",
        userFullName: "Testador Pereira");
    when(() => mockRepository.userSingUp(userInfo))
        .thenAnswer((invocation) async => Right(succesUser));
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<SingUpUser>());
  });
  group("Fail to sing up", (){
    test('Empty email', () async {
    final userInfo = SingUpUser(email: "", password: "teste123", userFullName: "Testador Pereira");
    when(() => mockRepository.userSingUp(userInfo))
        .thenAnswer((invocation) async => Right(succesUser));
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<MissingRequiredValue>());
  });
  test('Empty password', () async {
    final userInfo = SingUpUser(email: "teste@teste.com", password: "", userFullName: "Testador Pereira");
    when(() => mockRepository.userSingUp(userInfo))
        .thenAnswer((invocation) async => Right(succesUser));
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<MissingRequiredValue>());
  });

  test('Empty userFullName', () async {
  final userInfo = SingUpUser(email: "teste@teste.com", password: "teste123", userFullName: "");
    when(() => mockRepository.userSingUp(userInfo))
        .thenAnswer((invocation) async => Right(succesUser));
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<MissingRequiredValue>());
  });
  });
}

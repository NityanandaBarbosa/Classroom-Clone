import 'package:flutter_test/flutter_test.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_up_errors.dart';
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
      password: "Teste123",
      name: "Testador Pereira");

  test('Success singup', () async {
    final userInfo = SingUpParams(
        email: "teste@teste.com",
        password: "Teste123",
        name: "Testador Pereira");
    when(() => mockRepository.userSingUp(userInfo))
        .thenAnswer((invocation) async => Right(succesUser));
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<SingedUser>());
  });
  group("Fail to sing up -", (){
    test('Empty email', () async {
    final userInfo = SingUpParams(email: "", password: "Teste123", name: "Testador Pereira");
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<MissingRequiredValue>());
  });
  test('Empty password', () async {
    final userInfo = SingUpParams(email: "teste@teste.com", password: "", name: "Testador Pereira");
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<MissingRequiredValue>());
  });

  test('Empty name', () async {
    final userInfo = SingUpParams(email: "teste@teste.com", password: "Teste123", name: "");
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<MissingRequiredValue>());
  });

  test('Email out of patterns', () async {
    final userInfo = SingUpParams(email: "teste.com", password: "Teste123", name: "Testador Pereira");
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<EmailOutOfPattern>());
  });

  test('Password out of patterns', () async {
    final userInfo = SingUpParams(email: "teste@gmail.com", password: "teste", name: "Testador Pereira");
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<PasswordOutOfPattern>());
  });

  test('Email already in use', () async {
    final userInfo = SingUpParams(
        email: "teste@teste.com",
        password: "Teste123",
        name: "Testador Pereira");
    when(() => mockRepository.userSingUp(userInfo))
        .thenAnswer((invocation) async => const Left(EmailAlreadyUsed()));
    final result = await usercase(userInfo);
    expect(result.fold(id, id), isA<EmailAlreadyUsed>());
  });

  });
}

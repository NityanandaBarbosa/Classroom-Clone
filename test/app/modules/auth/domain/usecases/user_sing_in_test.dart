import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifroom/app/modules/auth/domain/entities/access_token.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_in_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_in_errors.dart';
import 'package:ifroom/app/modules/auth/domain/repositories/sing_in_repository.dart';
import 'package:ifroom/app/modules/auth/domain/usecases/user_sing_in.dart';
import 'package:mocktail/mocktail.dart';

class SingInRepositoryMock extends Mock implements SingInRepository {}

void main() {
  final repository = SingInRepositoryMock();
  final params = SingInParams(email: "teste@gmail.com", password: "Teste123");
  test('Should return a AccessToken', () async {
    final accessToken =
        AccessToken(accessToken: "asdasdsadasd", expiresAt: DateTime.now());
    when(() => repository.userSingIn(params))
        .thenAnswer((_) async => Right(accessToken));
    final usecase = UserSingInImpl(repository);
    final result = await usecase(params);
    expect(result.fold(id, id), isA<AccessToken>());
  });

  test('Should return a SingInException', () async {
    const exception = SingInException("Error");
    when(() => repository.userSingIn(params))
        .thenAnswer((_) async => const Left(exception));
    final usecase = UserSingInImpl(repository);
    final result = await usecase(params);
    expect(result.fold(id, id), isA<SingInException>());
  });

  test('Should return a InvalidCredentials', () async {
    const exception = InvalidCredentials("Error");
    when(() => repository.userSingIn(params))
        .thenAnswer((_) async => const Left(exception));
    final usecase = UserSingInImpl(repository);
    final result = await usecase(params);
    expect(result.fold(id, id), isA<InvalidCredentials>());
  });
}

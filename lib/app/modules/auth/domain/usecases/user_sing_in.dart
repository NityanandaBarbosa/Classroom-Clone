import 'package:dartz/dartz.dart';
import 'package:ifroom/app/modules/auth/domain/entities/access_token.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_in_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_in_errors.dart';
import 'package:ifroom/app/modules/auth/domain/repositories/sing_in_repository.dart';

class UserSingIn {
  final SingInRepository repository;

  UserSingIn(this.repository);

  Future<Either<SingInException, AccessToken>> call(SingInParams params) {
    return repository.userSingIn(params);
  }
}

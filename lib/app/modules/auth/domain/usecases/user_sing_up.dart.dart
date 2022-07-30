import 'package:dartz/dartz.dart';
import 'package:ifroom/app/core/utils/validator.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_up_errors.dart';
import 'package:ifroom/app/modules/auth/domain/repositories/sing_up_repository.dart';

abstract class UserSingUp {
  Future<Either<SingUpException, SingedUser>> call(SingUpParams singedUser);
}

class UserSingUpImpl implements UserSingUp {
  final SingUpRepository repository;

  UserSingUpImpl(this.repository);

  @override
  Future<Either<SingUpException, SingedUser>> call(SingUpParams params) async {
    if (params.email.isEmpty ||
        params.password.isEmpty ||
        params.name.isEmpty) {
      return left(const MissingRequiredValue("Some field is empty"));
    }
    if (!Validator.isValidEmail(params.email)) {
      return left(const EmailOutOfPattern("Your email is out of pattern"));
    }
    if (!Validator.isValidPassword(params.password)) {
      return left(const PasswordOutOfPattern("Your password is out of pattern"));
    }
    return await repository.userSingUp(params);
  }
}

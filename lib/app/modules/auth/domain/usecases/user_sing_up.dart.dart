import 'package:dartz/dartz.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/errors.dart';
import 'package:ifroom/app/modules/auth/domain/repositories/sing_up_repository.dart';

abstract class UserSingUp {
  Future<Either<SingUpException, SingUpUser>> call(SingedUser singedUser);
}

class UserSingUpImpl implements UserSingUp {
  final SingUpRepository repository;

  UserSingUpImpl(this.repository);

  @override
  Future<Either<SingUpException, SingedUser>> call(SingUpUser userInfo) async {
    if (userInfo.email.isEmpty || userInfo.password.isEmpty || userInfo.userFullName.isEmpty) {
      return left(const MissingRequiredValue("Some field is empty"));
    }
    return await repository.userSingUp(userInfo);
  }
}

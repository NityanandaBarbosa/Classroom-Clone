import 'package:dartz/dartz.dart';

import '../entities/sing_up_user.dart';
import '../errors/errors.dart';

abstract class SingUpRepository {
  Future<Either<SingUpException, SingedUser>> userSingUp(SingUpUser user);
}
